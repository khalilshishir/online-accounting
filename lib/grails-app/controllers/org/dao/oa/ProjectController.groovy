package org.dao.oa

import java.text.SimpleDateFormat

class ProjectController {

    def index() {
        redirect(action: 'list')
    }

    def save(){
        println(params)
        String message

        Project project = null
        if(params.hidProjectId){
            //this code is only for edit data
            project = Project.get(params.hidProjectId)
            project.projectName = params.projectName

            def updatedAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(updatedAt)
            project.updatedAt = updatedAt
            message="updated Successfully"
        } else {
            //this code for save the data
            project = new Project()
            project.validate(params)
            project.isActive = true

            def createdAt = new Date()
            SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy")
            sdf.format(createdAt)

            project.properties = params
            message="Save Successfully"
        }
        project.save()
        def projectList = Project.findAllWhere(isActive: true)
        flash.message=message
        render(view: 'create',model: [project : project, projectList: projectList])
    }

    def list() {
        def projectList = Project.findAllWhere(isActive: true)
        render(view: 'create', model: [projectList: projectList])
    }

    def delete(Long id) {
        Project project = Project.read(id)
        if(project){

            project.isActive=false
            project.save();
            redirect(action: 'list')
        }
    }

    def update(Long id) {
        Project project = Project.read(id)
        def projectList = Project.findAllWhere(isActive: true)
        render(view: 'create', model: [project:project,
                projectList :projectList, hidProjectId:project.id])
    }

}
