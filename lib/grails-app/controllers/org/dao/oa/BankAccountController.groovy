package org.dao.oa

import java.text.SimpleDateFormat

class BankAccountController {

    def index() {
        redirect(action: 'list')
    }
    def save(){
        println(params)
        String message

        BankAccount bankAccount = null
        if(params.hidBankAccountId){
            //this code is only for edit data
            bankAccount = BankAccount.get(params.hidBankAccountId)
            bankAccount.bankAccountName = params.bankAccountName
            bankAccount.bankName = params.bankName
            bankAccount.accountNumber = params.accountNumber
            bankAccount.accountType = params.accountType
            Project project = Project.read(params.project)
            CoAMaster coaMaster = CoAMaster.read(params.coaMaster)

            bankAccount.address = params.address
            bankAccount.project = project
            bankAccount.coaMaster = coaMaster

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            bankAccount.updatedAt = updatedAt
            message="updated Successfully"
        } else {
            //this code for save the data
            bankAccount = new BankAccount()
            bankAccount.validate(params)
            bankAccount.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            bankAccount.properties = params
            message="Save Successfully"
        }
        bankAccount.save()
        def bankAccountList = BankAccount.findAllWhere(isActive: true)
        flash.message=message
        render(view: 'create',model: [bankAccount:bankAccount, bankAccountList: bankAccountList])
    }

    def projectSelected(){
        def project = Project.findById(params.id)
        def coAMasterInfo=CoAMaster.findAllByProject(project);
        render g.select(optionKey: 'id', optionValue: 'accountName', from: coAMasterInfo, id: 'coaMaster', name: "coaMaster")
    }

    def list() {
        def bankAccountList = BankAccount.findAllWhere(isActive: true)
        render(view: 'create', model: [bankAccountList: bankAccountList])
    }

    def delete(Long id) {
        BankAccount bankAccount = BankAccount.read(id)
        if(bankAccount){

            bankAccount.isActive=false
            bankAccount.save();
            redirect(action: 'list')
        }

    }
    def update(Long id) {
        BankAccount bankAccount = BankAccount.read(id)
        def bankAccountList = BankAccount.findAllWhere(isActive: true)
        render(view: 'create', model: [bankAccount : bankAccount, bankAccountList :bankAccountList, hidBankAccountId:bankAccount.id])
    }
}
