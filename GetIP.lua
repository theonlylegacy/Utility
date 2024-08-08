local HttpService = game:GetService("HttpService")
local Split, Format = string.split, string.format
local Response = request({Url = "https://httpbin.org/get", Method = "GET"})
local Body = Response.Success and HttpService:JSONDecode(Response.Body)

return Body and Body.origin or Format("Status Code: [%s]", tostring(Response.StatusCode))
