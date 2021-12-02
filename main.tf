data "archive_file" "pet_script" {

  type        = "zip"
  source_file = "${path.module}/files/${var.pet_script_filename}.py" 
  output_path = "${path.module}/files/${var.pet_script_filename}.zip" 
}