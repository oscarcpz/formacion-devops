output "current_subscription_display_name" {
  value = data.azurerm_subscription.current.display_name
}

output "current_subscription_state" {
  value = data.azurerm_subscription.current.state
}