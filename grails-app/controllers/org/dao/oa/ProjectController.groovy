package org.dao.oa

class ProjectController {

    def index() {
        redirect(action : 'list')
    }
    def save (){
        println params

        Project project = null
        if(params.hidProjectId){
            project = Project.get(params.hidProjectId)
            project.projectName = params.projectName
        } else {
            project = new Project()
            project.validate(params)
            project.properties = params

        }
        project.save()
        def projectList = Project.findAll()
        render(view: 'create',model: [project:project, projectList: projectList])
    }


    def list() {
        def projectList = Project.findAll()
        render(view: 'create', model: [projectList: projectList])
    }
    def delete(Long id) {
        Project project = Project.read(id)
        project.delete();
        redirect(action: 'list')
    }
    def update(Long id) {
        Project project = Project.read(id)
        def projectList = Project.findAll()

        render(view: 'create', model: [projectName: project.projectName,hidProjectId:project.id])
    }
}
