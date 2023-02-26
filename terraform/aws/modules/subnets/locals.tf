locals {
  public_1 = element(sort(tolist(data.aws_subnets.public.ids)),0)
}