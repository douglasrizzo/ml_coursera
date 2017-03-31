## Copyright (C) 2017 Douglas De Rizzo Meneghetti
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} squareAndCubeThisNumber (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Douglas De Rizzo Meneghetti <douglas@aurora>
## Created: 2017-01-04

function [retval1, retval2] = squareAndCubeThisNumber (input1, input2)
  retval1 = input1 ^ 2;
  retval2 = input2 ^ 2;
endfunction
