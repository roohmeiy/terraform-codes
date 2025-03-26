# // use =if  u r creating an instance and u want to give that multiple security group then u'll use it

# variable list{
#     # type = list
#     default=[ "pihu","zuni","panda" ]
# }

# # output printFirst {
# #     value = var.list[1]
# # }

# //or

# # output "printFirstAndSecond" {
# #   value = {
# #     first  = var.list[0]
# #     second = var.list[1]
# #   }
# # }

# output "printList" {
#     value= "${join("->", var.list)}"
# }
# output upper{
#     value= upper(var.list[2])
# }