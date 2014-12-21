package org.dao.oa

class DesignationController {

    def index() {
        redirect(action: 'list')
    }

    def list() {
        def desigList = Designation.findAll()
        render(view: 'InsertDesignation', model: [designationList: desigList])
    }

    def save() {

        println params
        Designation designation = null
        if (params.hidDesignationId) {
            designation = Designation.get(params.hidDesignationId)
            designation.desigId = params.desigId
            designation.desigName = params.desigName
        } else {
            designation = new Designation()
            designation.properties = params
        }
        designation.save()
        redirect(action: 'list')
    }

    def delete(Long id) {
        Designation designation = Designation.read(id)
        designation.delete()
        redirect(action: 'list')
    }
def update(Long id){
    Designation designation=Designation.read(id)
    def designationList=Designation.findAll()
    render (view:'InsertDesignation',model: [id:designation.id,desigId:designation.desigId,desigName:designation.desigName,designationList: designationList])
}


}
