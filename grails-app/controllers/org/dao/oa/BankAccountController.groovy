package org.dao.oa

import org.oa.util.AccountType

import java.text.SimpleDateFormat

class BankAccountController {

    def index() {
        redirect(action: 'list')
    }
    def save(){
        println(params)

        BankAccount bankAccount = null
        if(params.hidBankAccountId){
            //this code is only for edit data
            bankAccount = BankAccount.get(params.hidBankAccountId)
            bankAccount.bankAccountName = params.bankAccountName
            bankAccount.bankName = params.bankName
            bankAccount.accountNumber = params.accountNumber
            bankAccount.accountType = params.accountType
            def project = Project.read(bankAccount.project.id)
            def coaMaster = CoAMasterInfo.read(bankAccount.coaMaster.id)

            bankAccount.address = params.address
            bankAccount.project = project
            bankAccount.coaMaster = coaMaster

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
        } else {
            //this code for save the data
            bankAccount = new BankAccount()
            bankAccount.validate(params)
            bankAccount.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            bankAccount.properties = params
        }
        bankAccount.save()
        def bankAccountList = BankAccount.findAllWhere(isActive: true)
        render(view: 'create',model: [bankAccount:bankAccount, bankAccountList: bankAccountList])
    }

    def projectSelected(){
        def project = Project.findById(params.id)
        def coAMasterInfo=CoAMasterInfo.findAllByProject(project);
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
       //def accountType=AccountType.find( bankAccount.accountType)
        render(view: 'create', model: [bankAccountName: bankAccount.bankAccountName,
                            bankName: bankAccount.bankName, accountNumber: bankAccount.accountNumber,
                              accountType: bankAccount.accountType ,address: bankAccount.address,
                                bankAccountList :bankAccountList, hidBankAccountId:bankAccount.id])
    }
}
