local TukeyLoss,parent = torch.class('nn.TukeyLoss','nn.Criterion')

function TukeyLoss:__init(sizeAverage)
  parent.__init(self)
  if sizeAverage ~= nil then
    self.sizeAverage = sizeAverage
  else
    self.sizeAverage = true
  end
  self.c = 4.685
  self.iter = 1
end

function TukeyLoss:updateOutput(input_,target_)
 res = updateRes(input_,target_,self.c,self.iter) 

local res_temp = res:clone()
res_temp:div(self.c):pow(2)
res_temp = 1 - res_temp
res_temp:pow(3)
local yt = (1-res_temp)*3.6582
local res_dummy = res:clone():abs()
yt[res_dummy:gt(self.c)] = 3.6582
self.output = torch.sqrt(torch.sum(yt))
return self.output
end

function TukeyLoss:updateGradInput(input_, target_)
  res = updateRes(input_,target_,self.c,self.iter)
  res = updateRes(input_,target_,self.c,self.iter)
local tu = (1-res:clone():div(self.c):pow(2)):pow(2):cmul(res:clone()):mul(-1)
local temp_y = torch.abs(res:clone()):lt(self.c):float()
temp_y = temp_y:cmul(tu)
self.gradInput = temp_y
return self.gradInput
end
function mad(x)
  if x == nil then
    error('Input for MAD calculation is empty')
  end

  y = torch.median(x)
  local temp_size = x:size(2)
y = y:repeatTensor(1,temp_size)
  output = torch.median(torch.abs(x:add(-y)))
  return output
end
function updateRes(input_,target_,c,iter)
  local input = input_:clone()
  local target=target_:clone()
  local res = target-input
  local MAD = 1.4826 * mad(res:clone())
  local temp = 100*torch.sum(torch.abs(res:clone()):lt(c))
  local nonZero = torch.round(temp/torch.numel(res:clone()))

  if nonZero<70 then
    MAD=MAD*7
  end
  
MAD = MAD:repeatTensor(1,res:size(2))
res:cdiv(MAD)
return res
end

function TukeyLoss:updateIter(iter)
  self.iter = iter
  end