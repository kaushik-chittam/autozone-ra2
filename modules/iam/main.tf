
//Need to find out how to do this
resource "google_project_iam_member" "project" {
  project = var.project_id
  role    = var.role
  member  = var.member
}