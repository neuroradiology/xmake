--!A cross-platform build utility based on Lua
--
-- Licensed to the Apache Software Foundation (ASF) under one
-- or more contributor license agreements.  See the NOTICE file
-- distributed with this work for additional information
-- regarding copyright ownership.  The ASF licenses this file
-- to you under the Apache License, Version 2.0 (the
-- "License"); you may not use this file except in compliance
-- with the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
-- 
-- Copyright (C) 2015 - 2019, TBOOX Open Source Group.
--
-- @author      ruki
-- @file        has_cfuncs.lua
--

-- imports
import("lib.detect.check_cxsnippets")

-- has the given c funcs?
--
-- @param funcs     the funcs
-- @param opt       the argument options
--                  .e.g 
--                  { verbose = false, target = [target|option], includes = "", configs = {linkdirs = .., links = .., defines = .., ..}}
--
-- funcs:
--      sigsetjmp
--      sigsetjmp((void*)0, 0)
--      sigsetjmp{sigsetjmp((void*)0, 0);}
--      sigsetjmp{int a = 0; sigsetjmp((void*)a, a);}
--
-- @return          true or false
--
-- @code
-- local ok = has_cfuncs("setjmp")
-- local ok = has_cfuncs({"sigsetjmp((void*)0, 0)", "setjmp"}, {includes = "setjmp.h"})
-- @endcode
--
function main(funcs, opt)

    -- init options
    opt = opt or {}

    -- init funcs
    opt.sourcekind = "cc"
    opt.funcs      = funcs
    
    -- has funcs?
    local name = opt.name or "has_cfuncs"
    return check_cxsnippets({[name] = ""}, opt)
end
