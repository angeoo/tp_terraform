output "name_to_id" {
  value = { for inst in aws_instance.demo : inst.tags.Name => inst.id }
}
