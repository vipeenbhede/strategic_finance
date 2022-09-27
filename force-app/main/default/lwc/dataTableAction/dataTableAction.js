import { LightningElement, wire, track, api } from 'lwc';
import getJsonData from '@salesforce/apex/DataTableActions.getJSONData';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class DataTableAction extends LightningElement {


	@track columns = [
		{ label: 'Creditor', fieldName: 'creditorName', type: 'Text' },
		{ label: 'First Name', fieldName: 'firstName', type: 'text' },
		{ label: 'Last Name', fieldName: 'lastName', type: 'text' },
		{ label: 'Min Pay %', fieldName: 'minPaymentPercentage', type: 'number', typeAttributes: { maximumFractionDigits: '2',  alignment: 'right' } },
		{ label: 'Balance', fieldName: 'balance', type: 'currency', typeAttributes: { step: '0.01', alignment: 'center' } }
	];

	@track creditorName;
	@track firstName;
	@track lastName;
	@track minPaymentPercentage;
	@track balance;
	@track selectedRows = [];
	@track errorMsg;
	@track jsonData;
	@track splicedData;
	@track error;
	@track totalBal = 0;
	@track totalRowCnt = 0;
	@track chkRowCnt = 0;
	@track isModalOpen = false;
	@api isLoaded = false;
    

	//Wire method to call apex class and get the Debt data form external system
	@wire(getJsonData)
	wiredJson({ data, error }) {
		if (data) {
			this.jsonData = JSON.parse(data);
			this.error = undefined;
			this.resetValues();
			this.calculateTotal();
			this.totalRowCount();

		} else {
			this.jsonData = undefined;
			this.error = error;
		}
		this.handleClick();
	}

	//get selected debt value and update the coun with the records
	getSelectedIdAction(event) {
		this.selectedRows = event.detail.selectedRows;
		this.chkRowCnt = this.selectedRows.length;
	}

	//remove debt from the list and update the the Datatable
	deleteRowAction() {
		this.selectedRows.forEach(rec => {
			this.jsonData = this.jsonData.filter(item => item.id != rec.id);
		});

		//to reset the value tble row changes
		this.resetValues();
		
		//to calculate balance once debt removed from table
		this.calculateTotal();

		//update total row count once debt removed from table
		this.totalRowCount();

		//show toast note that debt has been removed
		this.debtRemoveNote();
	}

	
	//To Add new debt record get inputs from user and store 
	handleInputChange(event) {
		this.inputLabel = event.target.label;
		this.inputValue = event.target.value;
		//Identify input value based on the data
		if (this.inputLabel === "Creditor Name" && this.inputValue !== null && this.inputValue !== '' && this.inputValue !== undefined) {
			this.creditorName = event.target.value;
		}
		if (this.inputLabel === "First Name" && this.inputValue !== null && this.inputValue !== '' && this.inputValue !== undefined) {
			this.firstName = event.target.value;
		}
		if (this.inputLabel === "Min Pay %" && this.inputValue !== null && this.inputValue !== '' && this.inputValue !== undefined) {
			this.minPaymentPercentage = event.target.value;
		}
		if (this.inputLabel === "Last Name" && this.inputValue !== null && this.inputValue !== '' && this.inputValue !== undefined) {
			this.lastName = event.target.value;
		}
		if (this.inputLabel === "Balance" && this.inputValue !== null && this.inputValue !== '' && this.inputValue !== undefined) {
			this.balance = event.target.value;
		}
	}

	//calculate the total balance and display on the UI
	calculateTotal() {
		this.jsonData.forEach(rec => {
			this.totalBal = this.totalBal + rec.balance;
		});
	}

	//calculate the total row in datatable and display on the UI
	totalRowCount() {
		this.totalRowCnt = this.jsonData.length;
	}

	//To conltol the Modal Visiblility 
	openModal() {
		this.resetValues();
		this.isModalOpen = true;
		this.calculateTotal();
		this.totalRowCount();
	}

	//To conltol the Modal Visiblility 
	closeModal() {
		this.resetRec();
		this.isModalOpen = false;
		this.calculateTotal();
		this.totalRowCount();
	}

	//Add new debt and refrest the datatable
	submitDetails() {
		const data = [];
		this.jsonData.forEach(rec => { data.push(rec); });

		var recVal = { 'id': this.jsonData[this.jsonData.length - 1].id+1, 'creditorName': this.creditorName, 'firstName': this.firstName, 'lastName': this.lastName, 'minPaymentPercentage': Number(this.minPaymentPercentage), 'balance': Number(this.balance) };
		
		data.push(recVal);
		this.showSuccessToast();
		this.jsonData = data;
		this.resetValues();
		this.calculateTotal();
		this.totalRowCount();
		this.resetRec();
		this.isModalOpen = false;
	}

	//to reset the value whenever value debt list has been updated 
	resetValues() {
		this.totalBal = 0;
		this.totalRowCnt = 0;
		this.chkRowCnt = 0;
	}

	//to reset the value of record variable whenever value for new debt has been added
	resetRec() {
		this.creditorName = '';
		this.lastName = '';
		this.firstName = '';
		this.balance = '';
		this.minPaymentPercentage = '';
	}

	//show toast msg on creation of new bedt
	showSuccessToast() {
		const evt = new ShowToastEvent({
			title: 'Debt Added',
			message: 'The debt has been succesfully added.',
			variant: 'success',
			mode: 'dismissable'
		});
		this.dispatchEvent(evt);
	}

	//show toast msg and notify user that debt has been removed
	debtRemoveNote() {
		const evt = new ShowToastEvent({
			title: 'Debt Removed...!',
			message: 'The debt record removed from the list.',
			variant: 'info',
			mode: 'dismissable'
		});
		this.dispatchEvent(evt);
	}

	// change isLoaded to the opposite of its current value
    handleClick() {
        this.isLoaded = !this.isLoaded;
    }

}