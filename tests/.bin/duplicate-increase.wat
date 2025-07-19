(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (param i32 i32) (result i32)))
  (type (;2;) (func (param i32 i32 i32)))
  (type (;3;) (func))
  (type (;4;) (func (param i32 i32)))
  (type (;5;) (func (param i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32)))
  (type (;8;) (func (param i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32)))
  (type (;11;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;12;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;13;) (func (param i64) (result i32)))
  (type (;14;) (func (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)))
  (import "env" "abort" (func $~lib/builtins/abort (type 7)))
  (import "conversion" "typeConversion.stringToH160" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160 (type 0)))
  (import "store" "clearStore" (func $~lib/matchstick-as/assembly/store/clearStore (type 3)))
  (import "index" "_registerHook" (func $~lib/matchstick-as/assembly/index/_registerHook (type 4)))
  (import "log" "log.log" (func $~lib/matchstick-as/assembly/log/log.log (type 4)))
  (import "index" "mockFunction" (func $~lib/matchstick-as/assembly/index/mockFunction (type 9)))
  (import "conversion" "typeConversion.bigIntToString" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString (type 0)))
  (import "index" "store.get" (func $~lib/@graphprotocol/graph-ts/index/store.get (type 1)))
  (import "ethereum" "ethereum.call" (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.call (type 0)))
  (import "conversion" "typeConversion.bytesToHex" (func $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex (type 0)))
  (import "numbers" "bigDecimal.toString" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString (type 0)))
  (import "index" "store.set" (func $~lib/@graphprotocol/graph-ts/index/store.set (type 2)))
  (import "numbers" "bigInt.plus" (func $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.plus (type 1)))
  (import "assert" "_assert.fieldEquals" (func $~lib/matchstick-as/assembly/assert/_assert.fieldEquals (type 6)))
  (import "index" "_registerTest" (func $~lib/matchstick-as/assembly/index/_registerTest (type 2)))
  (import "index" "_registerDescribe" (func $~lib/matchstick-as/assembly/index/_registerDescribe (type 4)))
  (func $~lib/rt/stub/__alloc (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i32.const 1073741820
    i32.gt_u
    if  ;; label = @1
      i32.const 1776
      i32.const 1840
      i32.const 33
      i32.const 29
      call $~lib/builtins/abort
      unreachable
    end
    global.get $~lib/rt/stub/offset
    local.tee 1
    i32.const 4
    i32.add
    local.tee 2
    local.get 0
    i32.const 19
    i32.add
    i32.const -16
    i32.and
    i32.const 4
    i32.sub
    local.tee 0
    i32.add
    local.tee 3
    memory.size
    local.tee 4
    i32.const 16
    i32.shl
    i32.const 15
    i32.add
    i32.const -16
    i32.and
    local.tee 5
    i32.gt_u
    if  ;; label = @1
      local.get 4
      local.get 3
      local.get 5
      i32.sub
      i32.const 65535
      i32.add
      i32.const -65536
      i32.and
      i32.const 16
      i32.shr_u
      local.tee 5
      local.get 4
      local.get 5
      i32.gt_s
      select
      memory.grow
      i32.const 0
      i32.lt_s
      if  ;; label = @2
        local.get 5
        memory.grow
        i32.const 0
        i32.lt_s
        if  ;; label = @3
          unreachable
        end
      end
    end
    local.get 3
    global.set $~lib/rt/stub/offset
    local.get 1
    local.get 0
    i32.store
    local.get 2)
  (func $~lib/rt/stub/__new (type 1) (param i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 1073741804
    i32.gt_u
    if  ;; label = @1
      i32.const 1776
      i32.const 1840
      i32.const 86
      i32.const 30
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.const 16
    i32.add
    call $~lib/rt/stub/__alloc
    local.tee 3
    i32.const 4
    i32.sub
    local.tee 2
    i32.const 0
    i32.store offset=4
    local.get 2
    i32.const 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 2
    local.get 0
    i32.store offset=16
    local.get 3
    i32.const 16
    i32.add)
  (func $~lib/memory/memory.fill (type 4) (param i32 i32)
    (local i32)
    block  ;; label = @1
      local.get 1
      i32.eqz
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8
      local.get 0
      local.get 1
      i32.add
      local.tee 2
      i32.const 1
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 2
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8 offset=1
      local.get 0
      i32.const 0
      i32.store8 offset=2
      local.get 2
      i32.const 2
      i32.sub
      i32.const 0
      i32.store8
      local.get 2
      i32.const 3
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 6
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store8 offset=3
      local.get 2
      i32.const 4
      i32.sub
      i32.const 0
      i32.store8
      local.get 1
      i32.const 8
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      local.get 0
      i32.sub
      i32.const 3
      i32.and
      local.tee 2
      i32.add
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      local.get 1
      local.get 2
      i32.sub
      i32.const -4
      i32.and
      local.tee 1
      i32.add
      local.tee 2
      i32.const 4
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 8
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=4
      local.get 0
      i32.const 0
      i32.store offset=8
      local.get 2
      i32.const 12
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 8
      i32.sub
      i32.const 0
      i32.store
      local.get 1
      i32.const 24
      i32.le_u
      br_if 0 (;@1;)
      local.get 0
      i32.const 0
      i32.store offset=12
      local.get 0
      i32.const 0
      i32.store offset=16
      local.get 0
      i32.const 0
      i32.store offset=20
      local.get 0
      i32.const 0
      i32.store offset=24
      local.get 2
      i32.const 28
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 24
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 20
      i32.sub
      i32.const 0
      i32.store
      local.get 2
      i32.const 16
      i32.sub
      i32.const 0
      i32.store
      local.get 0
      local.get 0
      i32.const 4
      i32.and
      i32.const 24
      i32.add
      local.tee 2
      i32.add
      local.set 0
      local.get 1
      local.get 2
      i32.sub
      local.set 1
      loop  ;; label = @2
        local.get 1
        i32.const 32
        i32.ge_u
        if  ;; label = @3
          local.get 0
          i64.const 0
          i64.store
          local.get 0
          i64.const 0
          i64.store offset=8
          local.get 0
          i64.const 0
          i64.store offset=16
          local.get 0
          i64.const 0
          i64.store offset=24
          local.get 1
          i32.const 32
          i32.sub
          local.set 1
          local.get 0
          i32.const 32
          i32.add
          local.set 0
          br 1 (;@2;)
        end
      end
    end)
  (func $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 5
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 7
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.const 0
    i32.store
    i32.const 16
    i32.const 9
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store offset=4
    local.get 1
    i32.const 0
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=12
    i32.const 32
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 32
    call $~lib/memory/memory.fill
    local.get 1
    local.get 2
    i32.store
    local.get 1
    local.get 2
    i32.store offset=4
    local.get 1
    i32.const 32
    i32.store offset=8
    local.get 1
    i32.const 0
    i32.store offset=12
    local.get 0
    local.get 1
    i32.store
    local.get 0)
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor (type 1) (param i32 i32) (result i32)
    (local i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 12
      i32.const 12
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 12
      i32.const 13
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 12
      i32.const 2
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    i32.const 0
    i32.store offset=8
    local.get 1
    i32.const 1073741820
    i32.gt_u
    if  ;; label = @1
      i32.const 1680
      i32.const 2016
      i32.const 19
      i32.const 57
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 2
    local.get 1
    call $~lib/memory/memory.fill
    local.get 0
    local.get 2
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store offset=8
    local.get 0)
  (func $~lib/typedarray/Uint8Array#__set (type 2) (param i32 i32 i32)
    local.get 0
    i32.load offset=8
    local.get 1
    i32.le_u
    if  ;; label = @1
      i32.const 2080
      i32.const 2144
      i32.const 177
      i32.const 45
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=4
    i32.add
    local.get 2
    i32.store8)
  (func $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32 (type 0) (param i32) (result i32)
    (local i32)
    i32.const 0
    i32.const 4
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor
    local.tee 1
    i32.const 0
    local.get 0
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 1
    local.get 0
    i32.const 8
    i32.shr_s
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 2
    local.get 0
    i32.const 16
    i32.shr_s
    i32.const 255
    i32.and
    call $~lib/typedarray/Uint8Array#__set
    local.get 1
    i32.const 3
    local.get 0
    i32.const 24
    i32.shr_s
    call $~lib/typedarray/Uint8Array#__set
    local.get 1)
  (func $~lib/util/memory/memcpy (type 2) (param i32 i32 i32)
    (local i32 i32 i32)
    loop  ;; label = @1
      local.get 1
      i32.const 3
      i32.and
      i32.const 0
      local.get 2
      select
      if  ;; label = @2
        local.get 0
        local.tee 3
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        local.tee 4
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 4
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 3
    i32.and
    i32.eqz
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i32.const 16
        i32.ge_u
        if  ;; label = @3
          local.get 0
          local.get 1
          i32.load
          i32.store
          local.get 0
          local.get 1
          i32.load offset=4
          i32.store offset=4
          local.get 0
          local.get 1
          i32.load offset=8
          i32.store offset=8
          local.get 0
          local.get 1
          i32.load offset=12
          i32.store offset=12
          local.get 1
          i32.const 16
          i32.add
          local.set 1
          local.get 0
          i32.const 16
          i32.add
          local.set 0
          local.get 2
          i32.const 16
          i32.sub
          local.set 2
          br 1 (;@2;)
        end
      end
      local.get 2
      i32.const 8
      i32.and
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load
        i32.store
        local.get 0
        local.get 1
        i32.load offset=4
        i32.store offset=4
        local.get 1
        i32.const 8
        i32.add
        local.set 1
        local.get 0
        i32.const 8
        i32.add
        local.set 0
      end
      local.get 2
      i32.const 4
      i32.and
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load
        i32.store
        local.get 1
        i32.const 4
        i32.add
        local.set 1
        local.get 0
        i32.const 4
        i32.add
        local.set 0
      end
      local.get 2
      i32.const 2
      i32.and
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load16_u
        i32.store16
        local.get 1
        i32.const 2
        i32.add
        local.set 1
        local.get 0
        i32.const 2
        i32.add
        local.set 0
      end
      local.get 2
      i32.const 1
      i32.and
      if  ;; label = @2
        local.get 0
        local.get 1
        i32.load8_u
        i32.store8
      end
      return
    end
    local.get 2
    i32.const 32
    i32.ge_u
    if  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              local.get 0
              i32.const 3
              i32.and
              i32.const 1
              i32.sub
              br_table 0 (;@5;) 1 (;@4;) 2 (;@3;) 3 (;@2;)
            end
            local.get 1
            i32.load
            local.set 5
            local.get 0
            local.get 1
            i32.load8_u
            i32.store8
            local.get 0
            local.get 1
            i32.load8_u offset=1
            i32.store8 offset=1
            local.get 0
            i32.const 2
            i32.add
            local.tee 3
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            i32.const 2
            i32.add
            local.tee 4
            i32.const 1
            i32.add
            local.set 1
            local.get 3
            local.get 4
            i32.load8_u
            i32.store8
            local.get 2
            i32.const 3
            i32.sub
            local.set 2
            loop  ;; label = @5
              local.get 2
              i32.const 17
              i32.ge_u
              if  ;; label = @6
                local.get 0
                local.get 1
                i32.load offset=1
                local.tee 3
                i32.const 8
                i32.shl
                local.get 5
                i32.const 24
                i32.shr_u
                i32.or
                i32.store
                local.get 0
                local.get 1
                i32.load offset=5
                local.tee 4
                i32.const 8
                i32.shl
                local.get 3
                i32.const 24
                i32.shr_u
                i32.or
                i32.store offset=4
                local.get 0
                local.get 1
                i32.load offset=9
                local.tee 3
                i32.const 8
                i32.shl
                local.get 4
                i32.const 24
                i32.shr_u
                i32.or
                i32.store offset=8
                local.get 0
                local.get 1
                i32.load offset=13
                local.tee 5
                i32.const 8
                i32.shl
                local.get 3
                i32.const 24
                i32.shr_u
                i32.or
                i32.store offset=12
                local.get 1
                i32.const 16
                i32.add
                local.set 1
                local.get 0
                i32.const 16
                i32.add
                local.set 0
                local.get 2
                i32.const 16
                i32.sub
                local.set 2
                br 1 (;@5;)
              end
            end
            br 2 (;@2;)
          end
          local.get 1
          i32.load
          local.set 5
          local.get 0
          local.get 1
          i32.load8_u
          i32.store8
          local.get 0
          local.tee 3
          i32.const 2
          i32.add
          local.set 0
          local.get 1
          local.tee 4
          i32.const 2
          i32.add
          local.set 1
          local.get 3
          local.get 4
          i32.load8_u offset=1
          i32.store8 offset=1
          local.get 2
          i32.const 2
          i32.sub
          local.set 2
          loop  ;; label = @4
            local.get 2
            i32.const 18
            i32.ge_u
            if  ;; label = @5
              local.get 0
              local.get 1
              i32.load offset=2
              local.tee 3
              i32.const 16
              i32.shl
              local.get 5
              i32.const 16
              i32.shr_u
              i32.or
              i32.store
              local.get 0
              local.get 1
              i32.load offset=6
              local.tee 4
              i32.const 16
              i32.shl
              local.get 3
              i32.const 16
              i32.shr_u
              i32.or
              i32.store offset=4
              local.get 0
              local.get 1
              i32.load offset=10
              local.tee 3
              i32.const 16
              i32.shl
              local.get 4
              i32.const 16
              i32.shr_u
              i32.or
              i32.store offset=8
              local.get 0
              local.get 1
              i32.load offset=14
              local.tee 5
              i32.const 16
              i32.shl
              local.get 3
              i32.const 16
              i32.shr_u
              i32.or
              i32.store offset=12
              local.get 1
              i32.const 16
              i32.add
              local.set 1
              local.get 0
              i32.const 16
              i32.add
              local.set 0
              local.get 2
              i32.const 16
              i32.sub
              local.set 2
              br 1 (;@4;)
            end
          end
          br 1 (;@2;)
        end
        local.get 1
        i32.load
        local.set 5
        local.get 0
        local.tee 3
        i32.const 1
        i32.add
        local.set 0
        local.get 1
        local.tee 4
        i32.const 1
        i32.add
        local.set 1
        local.get 3
        local.get 4
        i32.load8_u
        i32.store8
        local.get 2
        i32.const 1
        i32.sub
        local.set 2
        loop  ;; label = @3
          local.get 2
          i32.const 19
          i32.ge_u
          if  ;; label = @4
            local.get 0
            local.get 1
            i32.load offset=3
            local.tee 3
            i32.const 24
            i32.shl
            local.get 5
            i32.const 8
            i32.shr_u
            i32.or
            i32.store
            local.get 0
            local.get 1
            i32.load offset=7
            local.tee 4
            i32.const 24
            i32.shl
            local.get 3
            i32.const 8
            i32.shr_u
            i32.or
            i32.store offset=4
            local.get 0
            local.get 1
            i32.load offset=11
            local.tee 3
            i32.const 24
            i32.shl
            local.get 4
            i32.const 8
            i32.shr_u
            i32.or
            i32.store offset=8
            local.get 0
            local.get 1
            i32.load offset=15
            local.tee 5
            i32.const 24
            i32.shl
            local.get 3
            i32.const 8
            i32.shr_u
            i32.or
            i32.store offset=12
            local.get 1
            i32.const 16
            i32.add
            local.set 1
            local.get 0
            i32.const 16
            i32.add
            local.set 0
            local.get 2
            i32.const 16
            i32.sub
            local.set 2
            br 1 (;@3;)
          end
        end
      end
    end
    local.get 2
    i32.const 16
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 3
      i32.load8_u
      i32.store8
      local.get 3
      i32.const 2
      i32.add
      local.set 1
      local.get 0
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 8
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 3
      i32.load8_u
      i32.store8
      local.get 3
      i32.const 2
      i32.add
      local.set 1
      local.get 0
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 4
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      local.get 1
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.tee 0
      local.get 1
      i32.const 2
      i32.add
      local.tee 3
      i32.load8_u
      i32.store8
      local.get 3
      i32.const 2
      i32.add
      local.set 1
      local.get 0
      local.get 3
      i32.load8_u offset=1
      i32.store8 offset=1
      local.get 0
      i32.const 2
      i32.add
      local.set 0
    end
    local.get 2
    i32.const 2
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
      local.get 0
      local.tee 3
      i32.const 2
      i32.add
      local.set 0
      local.get 1
      local.tee 4
      i32.const 2
      i32.add
      local.set 1
      local.get 3
      local.get 4
      i32.load8_u offset=1
      i32.store8 offset=1
    end
    local.get 2
    i32.const 1
    i32.and
    if  ;; label = @1
      local.get 0
      local.get 1
      i32.load8_u
      i32.store8
    end)
  (func $~lib/memory/memory.copy (type 2) (param i32 i32 i32)
    (local i32 i32)
    block  ;; label = @1
      local.get 2
      local.set 4
      local.get 0
      local.get 1
      i32.eq
      br_if 0 (;@1;)
      local.get 1
      local.get 0
      i32.sub
      local.get 4
      i32.sub
      i32.const 0
      local.get 4
      i32.const 1
      i32.shl
      i32.sub
      i32.le_u
      if  ;; label = @2
        local.get 0
        local.get 1
        local.get 4
        call $~lib/util/memory/memcpy
        br 1 (;@1;)
      end
      local.get 0
      local.get 1
      i32.lt_u
      if  ;; label = @2
        local.get 1
        i32.const 7
        i32.and
        local.get 0
        i32.const 7
        i32.and
        i32.eq
        if  ;; label = @3
          loop  ;; label = @4
            local.get 0
            i32.const 7
            i32.and
            if  ;; label = @5
              local.get 4
              i32.eqz
              br_if 4 (;@1;)
              local.get 4
              i32.const 1
              i32.sub
              local.set 4
              local.get 0
              local.tee 2
              i32.const 1
              i32.add
              local.set 0
              local.get 1
              local.tee 3
              i32.const 1
              i32.add
              local.set 1
              local.get 2
              local.get 3
              i32.load8_u
              i32.store8
              br 1 (;@4;)
            end
          end
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              local.get 0
              local.get 1
              i64.load
              i64.store
              local.get 4
              i32.const 8
              i32.sub
              local.set 4
              local.get 0
              i32.const 8
              i32.add
              local.set 0
              local.get 1
              i32.const 8
              i32.add
              local.set 1
              br 1 (;@4;)
            end
          end
        end
        loop  ;; label = @3
          local.get 4
          if  ;; label = @4
            local.get 0
            local.tee 2
            i32.const 1
            i32.add
            local.set 0
            local.get 1
            local.tee 3
            i32.const 1
            i32.add
            local.set 1
            local.get 2
            local.get 3
            i32.load8_u
            i32.store8
            local.get 4
            i32.const 1
            i32.sub
            local.set 4
            br 1 (;@3;)
          end
        end
      else
        local.get 1
        i32.const 7
        i32.and
        local.get 0
        i32.const 7
        i32.and
        i32.eq
        if  ;; label = @3
          loop  ;; label = @4
            local.get 0
            local.get 4
            i32.add
            i32.const 7
            i32.and
            if  ;; label = @5
              local.get 4
              i32.eqz
              br_if 4 (;@1;)
              local.get 4
              i32.const 1
              i32.sub
              local.tee 4
              local.get 0
              i32.add
              local.get 1
              local.get 4
              i32.add
              i32.load8_u
              i32.store8
              br 1 (;@4;)
            end
          end
          loop  ;; label = @4
            local.get 4
            i32.const 8
            i32.ge_u
            if  ;; label = @5
              local.get 4
              i32.const 8
              i32.sub
              local.tee 4
              local.get 0
              i32.add
              local.get 1
              local.get 4
              i32.add
              i64.load
              i64.store
              br 1 (;@4;)
            end
          end
        end
        loop  ;; label = @3
          local.get 4
          if  ;; label = @4
            local.get 4
            i32.const 1
            i32.sub
            local.tee 4
            local.get 0
            i32.add
            local.get 1
            local.get 4
            i32.add
            i32.load8_u
            i32.store8
            br 1 (;@3;)
          end
        end
      end
    end)
  (func $~lib/rt/__newArray (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 2
    i32.shl
    local.tee 4
    i32.const 0
    call $~lib/rt/stub/__new
    local.set 3
    local.get 2
    if  ;; label = @1
      local.get 3
      local.get 2
      local.get 4
      call $~lib/memory/memory.copy
    end
    i32.const 16
    local.get 1
    call $~lib/rt/stub/__new
    local.tee 1
    local.get 3
    i32.store
    local.get 1
    local.get 3
    i32.store offset=4
    local.get 1
    local.get 4
    i32.store offset=8
    local.get 1
    local.get 0
    i32.store offset=12
    local.get 1)
  (func $start:tests/duplicate-increase.test~anonymous|0~anonymous|0 (type 3)
    call $~lib/matchstick-as/assembly/store/clearStore)
  (func $~lib/matchstick-as/assembly/index/MockedFunction#constructor (type 5) (param i32 i32 i32) (result i32)
    (local i32)
    i32.const 20
    i32.const 18
    call $~lib/rt/stub/__new
    local.tee 3
    i32.const 0
    i32.store8
    local.get 3
    i32.const 0
    i32.store offset=4
    local.get 3
    i32.const 0
    i32.store offset=8
    local.get 3
    i32.const 0
    i32.store offset=12
    local.get 3
    i32.const 0
    i32.const 20
    i32.const 4192
    call $~lib/rt/__newArray
    i32.store offset=16
    local.get 3
    local.get 0
    i32.store offset=4
    local.get 3
    local.get 1
    i32.store offset=8
    local.get 3
    local.get 2
    i32.store offset=12
    local.get 3)
  (func $~lib/string/String#concat (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.shl
    local.tee 2
    local.get 1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.const 1
    i32.shl
    local.tee 3
    i32.add
    local.tee 4
    i32.eqz
    if  ;; label = @1
      i32.const 4256
      return
    end
    local.get 4
    i32.const 1
    call $~lib/rt/stub/__new
    local.tee 4
    local.get 0
    local.get 2
    call $~lib/memory/memory.copy
    local.get 2
    local.get 4
    i32.add
    local.get 1
    local.get 3
    call $~lib/memory/memory.copy
    local.get 4)
  (func $~lib/array/Array<~lib/string/String>#__get (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=12
    local.get 1
    i32.le_u
    if  ;; label = @1
      i32.const 2080
      i32.const 1728
      i32.const 114
      i32.const 42
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.load offset=4
    local.get 1
    i32.const 2
    i32.shl
    i32.add
    i32.load
    local.tee 0
    i32.eqz
    if  ;; label = @1
      i32.const 4480
      i32.const 1728
      i32.const 118
      i32.const 40
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0)
  (func $~lib/matchstick-as/assembly/log/format (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    i32.const 4256
    local.set 4
    i32.const 2268
    i32.load
    i32.const 1
    i32.shr_u
    local.set 3
    loop  ;; label = @1
      local.get 3
      local.get 5
      i32.gt_s
      if  ;; label = @2
        local.get 3
        i32.const 1
        i32.sub
        local.get 5
        i32.gt_s
        if (result i32)  ;; label = @3
          i32.const 2268
          i32.load
          i32.const 1
          i32.shr_u
          local.get 5
          i32.le_u
          if (result i32)  ;; label = @4
            i32.const -1
          else
            local.get 5
            i32.const 1
            i32.shl
            i32.const 2272
            i32.add
            i32.load16_u
          end
          i32.const 123
          i32.eq
        else
          i32.const 0
        end
        if (result i32)  ;; label = @3
          local.get 5
          i32.const 1
          i32.add
          local.tee 1
          i32.const 2268
          i32.load
          i32.const 1
          i32.shr_u
          i32.ge_u
          if (result i32)  ;; label = @4
            i32.const -1
          else
            local.get 1
            i32.const 1
            i32.shl
            i32.const 2272
            i32.add
            i32.load16_u
          end
          i32.const 125
          i32.eq
        else
          i32.const 0
        end
        if  ;; label = @3
          local.get 0
          i32.load offset=12
          local.get 2
          i32.le_s
          if (result i32)  ;; label = @4
            i32.const 4288
            i32.const 2272
            call $~lib/string/String#concat
            i32.const 4384
            i32.const 48
            i32.const 9
            call $~lib/builtins/abort
            unreachable
          else
            local.get 2
            local.tee 1
            i32.const 1
            i32.add
            local.set 2
            local.get 4
            local.get 0
            local.get 1
            call $~lib/array/Array<~lib/string/String>#__get
            call $~lib/string/String#concat
            local.set 4
            local.get 5
            i32.const 1
            i32.add
          end
          local.set 5
        else
          i32.const 4256
          local.set 1
          local.get 5
          i32.const 2268
          i32.load
          i32.const 1
          i32.shr_u
          i32.lt_u
          if  ;; label = @4
            i32.const 2
            i32.const 1
            call $~lib/rt/stub/__new
            local.tee 1
            local.get 5
            i32.const 1
            i32.shl
            i32.const 2272
            i32.add
            i32.load16_u
            i32.store16
          end
          local.get 4
          local.get 1
          call $~lib/string/String#concat
          local.set 4
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 4)
  (func $~lib/matchstick-as/assembly/index/MockedFunction#withArgs (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load8_u
    if  ;; label = @1
      i32.const 0
      i32.const 0
      i32.const 3
      i32.const 4224
      call $~lib/rt/__newArray
      call $~lib/matchstick-as/assembly/log/format
      call $~lib/matchstick-as/assembly/log/log.log
    else
      local.get 0
      local.get 1
      i32.store offset=16
    end
    local.get 0)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress (type 0) (param i32) (result i32)
    (local i64)
    local.get 0
    i32.load offset=8
    i32.const 20
    i32.ne
    if  ;; label = @1
      i32.const 4608
      i32.const 4704
      i32.const 294
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.extend_i32_u
    local.set 1
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    local.get 1
    i64.store offset=8
    local.get 0)
  (func $~lib/matchstick-as/assembly/index/MockedFunction#returns (type 4) (param i32 i32)
    local.get 0
    i32.load8_u
    if  ;; label = @1
      i32.const 0
      i32.const 0
      i32.const 3
      i32.const 4816
      call $~lib/rt/__newArray
      call $~lib/matchstick-as/assembly/log/format
      call $~lib/matchstick-as/assembly/log/log.log
    else
      local.get 0
      i32.load offset=4
      local.get 0
      i32.load offset=8
      local.get 0
      i32.load offset=12
      local.get 0
      i32.load offset=16
      local.get 1
      i32.const 0
      call $~lib/matchstick-as/assembly/index/mockFunction
      local.get 0
      i32.const 1
      i32.store8
    end)
  (func $tests/helpers/mockPositionsCall (type 10) (param i32 i32 i32 i32 i32)
    (local i64 i32 i32)
    local.get 0
    i32.const 4848
    i32.const 4896
    call $~lib/matchstick-as/assembly/index/MockedFunction#constructor
    local.set 7
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 0
    i32.load offset=4
    drop
    local.get 1
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 4
    i32.store
    local.get 1
    local.get 5
    i64.store offset=8
    local.get 0
    i32.load offset=4
    local.get 1
    i32.store
    local.get 7
    local.get 0
    call $~lib/matchstick-as/assembly/index/MockedFunction#withArgs
    local.set 0
    i32.const 12
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 7
    i32.const 4
    i32.store
    local.get 7
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 7
    i32.store
    i32.const 0
    i32.const 20
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor
    local.set 7
    loop  ;; label = @1
      local.get 6
      i32.const 20
      i32.lt_s
      if  ;; label = @2
        local.get 7
        local.get 6
        i32.const 0
        call $~lib/typedarray/Uint8Array#__set
        local.get 6
        i32.const 1
        i32.add
        local.set 6
        br 1 (;@1;)
      end
    end
    local.get 7
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 6
    local.get 1
    i32.load offset=4
    local.get 6
    i32.store offset=4
    local.get 2
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 2
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=8
    local.get 3
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 2
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=12
    local.get 4
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=16
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=20
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 3
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=24
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=28
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=32
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=36
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=40
    i32.const 0
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i64.extend_i32_u
    local.set 5
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 4
    i32.store
    local.get 2
    local.get 5
    i64.store offset=8
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store offset=44
    local.get 0
    local.get 1
    call $~lib/matchstick-as/assembly/index/MockedFunction#returns)
  (func $tests/helpers/setupTrackedPoolMocks (type 2) (param i32 i32 i32)
    (local i64 i32 i32 i32)
    local.get 0
    i32.const 4064
    i32.const 4112
    call $~lib/matchstick-as/assembly/index/MockedFunction#constructor
    local.set 4
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 5
    i32.load offset=4
    drop
    local.get 1
    i64.extend_i32_u
    local.set 3
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 6
    i32.const 4
    i32.store
    local.get 6
    local.get 3
    i64.store offset=8
    local.get 5
    i32.load offset=4
    local.get 6
    i32.store
    local.get 4
    local.get 5
    call $~lib/matchstick-as/assembly/index/MockedFunction#withArgs
    local.set 4
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 5
    i32.load offset=4
    drop
    local.get 2
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 2
    local.get 5
    i32.load offset=4
    local.get 2
    i32.store
    local.get 4
    local.get 5
    call $~lib/matchstick-as/assembly/index/MockedFunction#returns
    local.get 0
    local.get 1
    global.get $tests/helpers/TOKEN0
    global.get $tests/helpers/TOKEN1
    global.get $tests/helpers/FEE
    call $tests/helpers/mockPositionsCall
    local.get 0
    i32.const 5136
    i32.const 5184
    call $~lib/matchstick-as/assembly/index/MockedFunction#constructor
    local.set 0
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    global.get $tests/helpers/FACTORY_ADDRESS
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 2
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store
    local.get 0
    local.get 1
    call $~lib/matchstick-as/assembly/index/MockedFunction#returns
    global.get $tests/helpers/TOKEN0
    local.set 0
    global.get $tests/helpers/TOKEN1
    local.set 1
    global.get $tests/helpers/FEE
    local.set 2
    global.get $tests/helpers/TRACKED_POOL
    local.set 4
    global.get $tests/helpers/FACTORY_ADDRESS
    i32.const 5248
    i32.const 5296
    call $~lib/matchstick-as/assembly/index/MockedFunction#constructor
    local.set 5
    i32.const 3
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 6
    i32.load offset=4
    drop
    local.get 0
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 0
    local.get 6
    i32.load offset=4
    local.get 0
    i32.store
    local.get 1
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 0
    local.get 6
    i32.load offset=4
    local.get 0
    i32.store offset=4
    local.get 2
    i64.extend_i32_u
    local.set 3
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 4
    i32.store
    local.get 0
    local.get 3
    i64.store offset=8
    local.get 6
    i32.load offset=4
    local.get 0
    i32.store offset=8
    local.get 5
    local.get 6
    call $~lib/matchstick-as/assembly/index/MockedFunction#withArgs
    local.set 0
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 1
    i32.load offset=4
    drop
    local.get 4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
    local.set 2
    local.get 1
    i32.load offset=4
    local.get 2
    i32.store
    local.get 0
    local.get 1
    call $~lib/matchstick-as/assembly/index/MockedFunction#returns)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor (type 11) (param i32 i32 i32 i32 i32 i32 i32 i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 32
      i32.const 22
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0
    local.get 3
    i32.store offset=8
    local.get 0
    local.get 4
    i32.store offset=12
    local.get 0
    local.get 5
    i32.store offset=16
    local.get 0
    local.get 6
    i32.store offset=20
    local.get 0
    local.get 7
    i32.store offset=24
    local.get 0
    local.get 8
    i32.store offset=28
    local.get 0)
  (func $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push (type 4) (param i32 i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    local.get 0
    i32.load offset=12
    local.tee 6
    i32.const 1
    i32.add
    local.tee 9
    local.get 0
    i32.load offset=8
    local.tee 8
    i32.const 2
    i32.shr_u
    i32.gt_u
    if  ;; label = @1
      local.get 9
      i32.const 268435455
      i32.gt_u
      if  ;; label = @2
        i32.const 1680
        i32.const 1728
        i32.const 19
        i32.const 48
        call $~lib/builtins/abort
        unreachable
      end
      block (result i32)  ;; label = @2
        local.get 0
        i32.load
        local.tee 5
        local.set 2
        local.get 8
        i32.const 1
        i32.shl
        local.tee 3
        i32.const 1073741820
        local.get 3
        i32.const 1073741820
        i32.lt_u
        select
        local.tee 3
        local.get 9
        i32.const 8
        local.get 9
        i32.const 8
        i32.gt_u
        select
        i32.const 2
        i32.shl
        local.tee 4
        local.get 3
        local.get 4
        i32.gt_u
        select
        local.tee 4
        local.tee 7
        i32.const 1073741804
        i32.gt_u
        if  ;; label = @3
          i32.const 1776
          i32.const 1840
          i32.const 99
          i32.const 30
          call $~lib/builtins/abort
          unreachable
        end
        local.get 2
        i32.const 16
        i32.sub
        local.tee 2
        i32.const 15
        i32.and
        i32.const 1
        local.get 2
        select
        if  ;; label = @3
          i32.const 0
          i32.const 1840
          i32.const 45
          i32.const 3
          call $~lib/builtins/abort
          unreachable
        end
        global.get $~lib/rt/stub/offset
        local.get 2
        local.get 2
        i32.const 4
        i32.sub
        local.tee 3
        i32.load
        local.tee 11
        i32.add
        i32.eq
        local.set 12
        local.get 7
        i32.const 16
        i32.add
        local.tee 13
        i32.const 19
        i32.add
        i32.const -16
        i32.and
        i32.const 4
        i32.sub
        local.set 10
        local.get 11
        local.get 13
        i32.lt_u
        if  ;; label = @3
          local.get 12
          if  ;; label = @4
            local.get 13
            i32.const 1073741820
            i32.gt_u
            if  ;; label = @5
              i32.const 1776
              i32.const 1840
              i32.const 52
              i32.const 33
              call $~lib/builtins/abort
              unreachable
            end
            local.get 2
            local.get 10
            i32.add
            local.tee 11
            memory.size
            local.tee 12
            i32.const 16
            i32.shl
            i32.const 15
            i32.add
            i32.const -16
            i32.and
            local.tee 13
            i32.gt_u
            if  ;; label = @5
              local.get 12
              local.get 11
              local.get 13
              i32.sub
              i32.const 65535
              i32.add
              i32.const -65536
              i32.and
              i32.const 16
              i32.shr_u
              local.tee 13
              local.get 12
              local.get 13
              i32.gt_s
              select
              memory.grow
              i32.const 0
              i32.lt_s
              if  ;; label = @6
                local.get 13
                memory.grow
                i32.const 0
                i32.lt_s
                if  ;; label = @7
                  unreachable
                end
              end
            end
            local.get 11
            global.set $~lib/rt/stub/offset
            local.get 3
            local.get 10
            i32.store
          else
            local.get 10
            local.get 11
            i32.const 1
            i32.shl
            local.tee 3
            local.get 3
            local.get 10
            i32.lt_u
            select
            call $~lib/rt/stub/__alloc
            local.tee 3
            local.get 2
            local.get 11
            call $~lib/memory/memory.copy
            local.get 3
            local.set 2
          end
        else
          local.get 12
          if  ;; label = @4
            local.get 2
            local.get 10
            i32.add
            global.set $~lib/rt/stub/offset
            local.get 3
            local.get 10
            i32.store
          end
        end
        local.get 2
        i32.const 4
        i32.sub
        local.get 7
        i32.store offset=16
        local.get 8
        local.get 2
        i32.const 16
        i32.add
        local.tee 2
        i32.add
      end
      local.get 4
      local.get 8
      i32.sub
      call $~lib/memory/memory.fill
      local.get 2
      local.get 5
      i32.ne
      if  ;; label = @2
        local.get 0
        local.get 2
        i32.store
        local.get 0
        local.get 2
        i32.store offset=4
      end
      local.get 0
      local.get 4
      i32.store offset=8
    end
    local.get 0
    i32.load offset=4
    local.get 6
    i32.const 2
    i32.shl
    i32.add
    local.get 1
    i32.store
    local.get 0
    local.get 9
    i32.store offset=12)
  (func $tests/helpers/createIncreaseLiquidityEvent (type 6) (param i32 i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    i32.const 0
    global.get $~lib/matchstick-as/assembly/defaults/defaultAddress
    local.tee 4
    global.get $~lib/matchstick-as/assembly/defaults/defaultBigInt
    local.tee 5
    local.tee 6
    local.get 6
    i32.const 2208
    block (result i32)  ;; label = @1
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
      local.set 6
      i32.const 60
      i32.const 23
      call $~lib/rt/stub/__new
      local.tee 7
      local.get 6
      i32.store
      local.get 7
      local.get 6
      i32.store offset=4
      local.get 7
      local.get 6
      i32.store offset=8
      local.get 7
      local.get 4
      i32.store offset=12
      local.get 7
      local.get 6
      i32.store offset=16
      local.get 7
      local.get 6
      i32.store offset=20
      local.get 7
      local.get 6
      i32.store offset=24
      local.get 7
      local.get 5
      i32.store offset=28
      local.get 7
      local.get 5
      i32.store offset=32
      local.get 7
      local.get 5
      i32.store offset=36
      local.get 7
      local.get 5
      i32.store offset=40
      local.get 7
      local.get 5
      i32.store offset=44
      local.get 7
      local.get 5
      i32.store offset=48
      local.get 7
      local.get 5
      i32.store offset=52
      local.get 7
      local.get 5
      i32.store offset=56
      local.get 7
    end
    block (result i32)  ;; label = @1
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
      local.set 4
      global.get $~lib/matchstick-as/assembly/defaults/defaultBigInt
      local.set 5
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddress
      local.set 6
      i32.const 36
      i32.const 24
      call $~lib/rt/stub/__new
      local.tee 7
      local.get 4
      i32.store
      local.get 7
      local.get 5
      i32.store offset=4
      local.get 7
      local.get 6
      i32.store offset=8
      local.get 7
      local.get 6
      i32.store offset=12
      local.get 7
      local.get 5
      i32.store offset=16
      local.get 7
      local.get 5
      i32.store offset=20
      local.get 7
      local.get 5
      i32.store offset=24
      local.get 7
      local.get 4
      i32.store offset=28
      local.get 7
      local.get 5
      i32.store offset=32
      local.get 7
    end
    i32.const 0
    i32.const 26
    i32.const 5408
    call $~lib/rt/__newArray
    block (result i32)  ;; label = @1
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
      local.set 9
      global.get $~lib/matchstick-as/assembly/defaults/defaultBigInt
      local.set 10
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddress
      local.set 11
      i32.const 1
      i32.const 31
      i32.const 0
      call $~lib/rt/__newArray
      local.tee 12
      i32.load offset=4
      drop
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddress
      local.set 13
      i32.const 1
      i32.const 29
      i32.const 0
      call $~lib/rt/__newArray
      local.tee 5
      i32.load offset=4
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
      local.tee 4
      i32.store
      global.get $~lib/matchstick-as/assembly/defaults/defaultIntBytes
      local.set 6
      global.get $~lib/matchstick-as/assembly/defaults/defaultBigInt
      local.tee 7
      local.set 8
      i32.const 1
      i32.const 30
      call $~lib/rt/stub/__new
      local.tee 14
      i32.const 0
      i32.store8
      local.get 14
      i32.const 0
      i32.store8
      i32.const 44
      i32.const 28
      call $~lib/rt/stub/__new
      local.tee 15
      local.get 13
      i32.store
      local.get 15
      local.get 5
      i32.store offset=4
      local.get 15
      local.get 4
      i32.store offset=8
      local.get 15
      local.get 4
      i32.store offset=12
      local.get 15
      local.get 6
      i32.store offset=16
      local.get 15
      local.get 4
      i32.store offset=20
      local.get 15
      local.get 7
      i32.store offset=24
      local.get 15
      local.get 8
      i32.store offset=28
      local.get 15
      local.get 7
      i32.store offset=32
      local.get 15
      i32.const 2208
      i32.store offset=36
      local.get 15
      local.get 14
      i32.store offset=40
      local.get 12
      i32.load offset=4
      local.get 15
      i32.store
      global.get $~lib/matchstick-as/assembly/defaults/defaultBigInt
      local.set 4
      global.get $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
      local.set 5
      i32.const 44
      i32.const 27
      call $~lib/rt/stub/__new
      local.tee 6
      local.get 9
      i32.store
      local.get 6
      local.get 10
      i32.store offset=4
      local.get 6
      local.get 9
      i32.store offset=8
      local.get 6
      local.get 10
      i32.store offset=12
      local.get 6
      local.get 10
      i32.store offset=16
      local.get 6
      local.get 10
      i32.store offset=20
      local.get 6
      local.get 11
      i32.store offset=24
      local.get 6
      local.get 12
      i32.store offset=28
      local.get 6
      local.get 4
      i32.store offset=32
      local.get 6
      local.get 5
      i32.store offset=36
      local.get 6
      local.get 5
      i32.store offset=40
      local.get 6
    end
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor
    local.set 4
    global.get $tests/helpers/CONTRACT_ADDRESS
    local.set 5
    local.get 4
    i32.load offset=4
    local.set 6
    local.get 4
    i32.load offset=8
    local.set 7
    local.get 4
    i32.load offset=12
    local.set 8
    local.get 4
    i32.load offset=16
    local.set 9
    local.get 4
    i32.load offset=20
    local.set 10
    local.get 4
    i32.load offset=24
    local.set 11
    local.get 4
    i32.load offset=28
    local.set 4
    i32.const 32
    i32.const 21
    call $~lib/rt/stub/__new
    local.get 5
    local.get 6
    local.get 7
    local.get 8
    local.get 9
    local.get 10
    local.get 11
    local.get 4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Event#constructor
    local.set 4
    i32.const 16
    i32.const 26
    call $~lib/rt/stub/__new
    local.tee 5
    i32.const 0
    i32.store
    local.get 5
    i32.const 0
    i32.store offset=4
    local.get 5
    i32.const 0
    i32.store offset=8
    local.get 5
    i32.const 0
    i32.store offset=12
    i32.const 32
    i32.const 0
    call $~lib/rt/stub/__new
    local.tee 6
    i32.const 32
    call $~lib/memory/memory.fill
    local.get 5
    local.get 6
    i32.store
    local.get 5
    local.get 6
    i32.store offset=4
    local.get 5
    i32.const 32
    i32.store offset=8
    local.get 5
    i32.const 0
    i32.store offset=12
    local.get 4
    local.get 5
    i32.store offset=24
    local.get 4
    i32.load offset=24
    block (result i32)  ;; label = @1
      local.get 0
      i64.extend_i32_u
      local.set 16
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 4
      i32.store
      local.get 0
      local.get 16
      i64.store offset=8
      i32.const 8
      i32.const 25
      call $~lib/rt/stub/__new
      local.tee 5
      i32.const 5440
      i32.store
      local.get 5
      local.get 0
      i32.store offset=4
      local.get 5
    end
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push
    local.get 4
    i32.load offset=24
    block (result i32)  ;; label = @1
      local.get 1
      i64.extend_i32_u
      local.set 16
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 4
      i32.store
      local.get 0
      local.get 16
      i64.store offset=8
      i32.const 8
      i32.const 25
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 5488
      i32.store
      local.get 1
      local.get 0
      i32.store offset=4
      local.get 1
    end
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push
    local.get 4
    i32.load offset=24
    block (result i32)  ;; label = @1
      local.get 2
      i64.extend_i32_u
      local.set 16
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 4
      i32.store
      local.get 0
      local.get 16
      i64.store offset=8
      i32.const 8
      i32.const 25
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 5536
      i32.store
      local.get 1
      local.get 0
      i32.store offset=4
      local.get 1
    end
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push
    local.get 4
    i32.load offset=24
    block (result i32)  ;; label = @1
      local.get 3
      i64.extend_i32_u
      local.set 16
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 4
      i32.store
      local.get 0
      local.get 16
      i64.store offset=8
      i32.const 8
      i32.const 25
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 5584
      i32.store
      local.get 1
      local.get 0
      i32.store offset=4
      local.get 1
    end
    call $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push
    local.get 4)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 3
    i32.eq
    if (result i32)  ;; label = @1
      i32.const 1
    else
      local.get 0
      i32.load
      i32.const 4
      i32.eq
    end
    i32.eqz
    if  ;; label = @1
      i32.const 5632
      i32.const 4704
      i32.const 84
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/string/String.__eq (type 1) (param i32 i32) (result i32)
    (local i32 i32 i32 i32)
    local.get 0
    local.get 1
    i32.eq
    if  ;; label = @1
      i32.const 1
      return
    end
    local.get 1
    i32.const 0
    local.get 0
    select
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee 3
    local.get 1
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    i32.ne
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    local.tee 2
    i32.const 7
    i32.and
    local.get 1
    i32.const 7
    i32.and
    i32.or
    i32.eqz
    local.get 3
    local.tee 0
    i32.const 4
    i32.ge_u
    i32.and
    if  ;; label = @1
      loop  ;; label = @2
        local.get 2
        i64.load
        local.get 1
        i64.load
        i64.eq
        if  ;; label = @3
          local.get 2
          i32.const 8
          i32.add
          local.set 2
          local.get 1
          i32.const 8
          i32.add
          local.set 1
          local.get 0
          i32.const 4
          i32.sub
          local.tee 0
          i32.const 4
          i32.ge_u
          br_if 1 (;@2;)
        end
      end
    end
    block  ;; label = @1
      loop  ;; label = @2
        local.get 0
        local.tee 3
        i32.const 1
        i32.sub
        local.set 0
        local.get 3
        if  ;; label = @3
          local.get 2
          i32.load16_u
          local.tee 5
          local.get 1
          i32.load16_u
          local.tee 4
          i32.sub
          local.set 3
          local.get 4
          local.get 5
          i32.ne
          br_if 2 (;@1;)
          local.get 2
          i32.const 2
          i32.add
          local.set 2
          local.get 1
          i32.const 2
          i32.add
          local.set 1
          br 1 (;@2;)
        end
      end
      i32.const 0
      local.set 3
    end
    local.get 3
    i32.eqz)
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get (type 1) (param i32 i32) (result i32)
    (local i32)
    loop  ;; label = @1
      local.get 0
      i32.load
      i32.load offset=12
      local.get 2
      i32.gt_s
      if  ;; label = @2
        local.get 0
        i32.load
        local.get 2
        call $~lib/array/Array<~lib/string/String>#__get
        i32.load
        local.get 1
        call $~lib/string/String.__eq
        if  ;; label = @3
          local.get 0
          i32.load
          local.get 2
          call $~lib/array/Array<~lib/string/String>#__get
          i32.load offset=4
          return
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    i32.const 0)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 6
    i32.ne
    if  ;; label = @1
      i32.const 5984
      i32.const 6064
      i32.const 64
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/util/number/utoa32_dec_lut (type 2) (param i32 i32 i32)
    (local i32)
    loop  ;; label = @1
      local.get 1
      i32.const 10000
      i32.ge_u
      if  ;; label = @2
        local.get 1
        i32.const 10000
        i32.rem_u
        local.set 3
        local.get 1
        i32.const 10000
        i32.div_u
        local.set 1
        local.get 2
        i32.const 4
        i32.sub
        local.tee 2
        i32.const 1
        i32.shl
        local.get 0
        i32.add
        local.get 3
        i32.const 100
        i32.div_u
        i32.const 2
        i32.shl
        i32.const 6588
        i32.add
        i64.load32_u
        local.get 3
        i32.const 100
        i32.rem_u
        i32.const 2
        i32.shl
        i32.const 6588
        i32.add
        i64.load32_u
        i64.const 32
        i64.shl
        i64.or
        i64.store
        br 1 (;@1;)
      end
    end
    local.get 1
    i32.const 100
    i32.ge_u
    if  ;; label = @1
      local.get 2
      i32.const 2
      i32.sub
      local.tee 2
      i32.const 1
      i32.shl
      local.get 0
      i32.add
      local.get 1
      i32.const 100
      i32.rem_u
      i32.const 2
      i32.shl
      i32.const 6588
      i32.add
      i32.load
      i32.store
      local.get 1
      i32.const 100
      i32.div_u
      local.set 1
    end
    local.get 1
    i32.const 10
    i32.ge_u
    if  ;; label = @1
      local.get 2
      i32.const 2
      i32.sub
      i32.const 1
      i32.shl
      local.get 0
      i32.add
      local.get 1
      i32.const 2
      i32.shl
      i32.const 6588
      i32.add
      i32.load
      i32.store
    else
      local.get 2
      i32.const 1
      i32.sub
      i32.const 1
      i32.shl
      local.get 0
      i32.add
      local.get 1
      i32.const 48
      i32.add
      i32.store16
    end)
  (func $~lib/util/number/itoa32 (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 6576
      return
    end
    i32.const 0
    local.get 0
    i32.sub
    local.get 0
    local.get 0
    i32.const 31
    i32.shr_u
    local.tee 0
    select
    local.tee 3
    i32.const 100000
    i32.lt_u
    if (result i32)  ;; label = @1
      local.get 3
      i32.const 100
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 3
        i32.const 10
        i32.ge_u
        i32.const 1
        i32.add
      else
        local.get 3
        i32.const 10000
        i32.ge_u
        i32.const 3
        i32.add
        local.get 3
        i32.const 1000
        i32.ge_u
        i32.add
      end
    else
      local.get 3
      i32.const 10000000
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 3
        i32.const 1000000
        i32.ge_u
        i32.const 6
        i32.add
      else
        local.get 3
        i32.const 1000000000
        i32.ge_u
        i32.const 8
        i32.add
        local.get 3
        i32.const 100000000
        i32.ge_u
        i32.add
      end
    end
    local.get 0
    i32.add
    local.tee 1
    i32.const 1
    i32.shl
    i32.const 1
    call $~lib/rt/stub/__new
    local.tee 2
    local.get 3
    local.get 1
    call $~lib/util/number/utoa32_dec_lut
    local.get 0
    if  ;; label = @1
      local.get 2
      i32.const 45
      i32.store16
    end
    local.get 2)
  (func $~lib/util/string/joinStringArray (type 5) (param i32 i32 i32) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 1
    i32.const 1
    i32.sub
    local.tee 6
    i32.const 0
    i32.lt_s
    if  ;; label = @1
      i32.const 4256
      return
    end
    local.get 6
    i32.eqz
    if  ;; label = @1
      local.get 0
      i32.load
      local.tee 0
      i32.const 4256
      local.get 0
      select
      return
    end
    loop  ;; label = @1
      local.get 1
      local.get 5
      i32.gt_s
      if  ;; label = @2
        local.get 5
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.tee 7
        if  ;; label = @3
          local.get 7
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          local.get 3
          i32.add
          local.set 3
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 6
    local.get 2
    i32.const 20
    i32.sub
    i32.load offset=16
    i32.const 1
    i32.shr_u
    local.tee 1
    i32.mul
    local.get 3
    i32.add
    i32.const 1
    i32.shl
    i32.const 1
    call $~lib/rt/stub/__new
    local.set 3
    i32.const 0
    local.set 5
    loop  ;; label = @1
      local.get 5
      local.get 6
      i32.lt_s
      if  ;; label = @2
        local.get 5
        i32.const 2
        i32.shl
        local.get 0
        i32.add
        i32.load
        local.tee 7
        if  ;; label = @3
          local.get 4
          i32.const 1
          i32.shl
          local.get 3
          i32.add
          local.get 7
          local.get 7
          i32.const 20
          i32.sub
          i32.load offset=16
          i32.const 1
          i32.shr_u
          local.tee 7
          i32.const 1
          i32.shl
          call $~lib/memory/memory.copy
          local.get 4
          local.get 7
          i32.add
          local.set 4
        end
        local.get 1
        if  ;; label = @3
          local.get 4
          i32.const 1
          i32.shl
          local.get 3
          i32.add
          local.get 2
          local.get 1
          i32.const 1
          i32.shl
          call $~lib/memory/memory.copy
          local.get 1
          local.get 4
          i32.add
          local.set 4
        end
        local.get 5
        i32.const 1
        i32.add
        local.set 5
        br 1 (;@1;)
      end
    end
    local.get 6
    i32.const 2
    i32.shl
    local.get 0
    i32.add
    i32.load
    local.tee 0
    if  ;; label = @1
      local.get 4
      i32.const 1
      i32.shl
      local.get 3
      i32.add
      local.get 0
      local.get 0
      i32.const 20
      i32.sub
      i32.load offset=16
      i32.const 1
      i32.shr_u
      i32.const 1
      i32.shl
      call $~lib/memory/memory.copy
    end
    local.get 3)
  (func $~lib/typedarray/Uint8Array#__get (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.load offset=8
    local.get 1
    i32.le_u
    if  ;; label = @1
      i32.const 2080
      i32.const 2144
      i32.const 166
      i32.const 45
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    local.get 0
    i32.load offset=4
    i32.add
    i32.load8_u)
  (func $src/constants/isTrackedPool (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    loop  ;; label = @1
      global.get $src/constants/TARGET_POOLS
      i32.load offset=12
      local.get 2
      i32.gt_s
      if  ;; label = @2
        block (result i32)  ;; label = @3
          global.get $src/constants/TARGET_POOLS
          local.get 2
          call $~lib/array/Array<~lib/string/String>#__get
          local.set 3
          i32.const 0
          local.set 1
          i32.const 0
          local.get 3
          i32.load offset=8
          local.get 0
          i32.load offset=8
          i32.ne
          br_if 0 (;@3;)
          drop
          loop  ;; label = @4
            local.get 3
            i32.load offset=8
            local.get 1
            i32.gt_s
            if  ;; label = @5
              i32.const 0
              local.get 3
              local.get 1
              call $~lib/typedarray/Uint8Array#__get
              local.get 0
              local.get 1
              call $~lib/typedarray/Uint8Array#__get
              i32.ne
              br_if 2 (;@3;)
              drop
              local.get 1
              i32.const 1
              i32.add
              local.set 1
              br 1 (;@4;)
            end
          end
          i32.const 1
        end
        if  ;; label = @3
          i32.const 1
          return
        end
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    i32.const 0)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#constructor (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 8
      i32.const 36
      call $~lib/rt/stub/__new
      local.set 0
    end
    local.get 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store offset=4
    local.get 0
    local.get 1
    i32.store
    local.get 0
    local.get 2
    i32.store offset=4
    local.get 0)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContractCall#constructor (type 12) (param i32 i32 i32 i32 i32) (result i32)
    (local i32)
    i32.const 20
    i32.const 42
    call $~lib/rt/stub/__new
    local.tee 5
    i32.const 0
    i32.store
    local.get 5
    i32.const 0
    i32.store offset=4
    local.get 5
    i32.const 0
    i32.store offset=8
    local.get 5
    i32.const 0
    i32.store offset=12
    local.get 5
    i32.const 0
    i32.store offset=16
    local.get 5
    local.get 0
    i32.store
    local.get 5
    local.get 1
    i32.store offset=4
    local.get 5
    local.get 2
    i32.store offset=8
    local.get 5
    local.get 3
    i32.store offset=12
    local.get 5
    local.get 4
    i32.store offset=16
    local.get 5)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#tryCall (type 6) (param i32 i32 i32 i32) (result i32)
    local.get 0
    i32.load
    local.get 0
    i32.load offset=4
    local.get 1
    local.get 2
    local.get 3
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContractCall#constructor
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.call
    local.tee 0
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 40
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      return
    end
    i32.const 4
    i32.const 40
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 4
    i32.const 41
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 1
    local.get 2
    i32.store
    local.get 1)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 8352
      i32.const 8448
      call $~lib/string/String#concat
      i32.const 4704
      i32.const 721
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i32.load
    i32.load)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    if  ;; label = @1
      i32.const 8608
      i32.const 4704
      i32.const 57
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32 (type 0) (param i32) (result i32)
    (local i32 i32 i32)
    local.get 0
    i32.load
    i32.const 3
    i32.eq
    if (result i32)  ;; label = @1
      i32.const 1
    else
      local.get 0
      i32.load
      i32.const 4
      i32.eq
    end
    i32.eqz
    if  ;; label = @1
      i32.const 5632
      i32.const 4704
      i32.const 75
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end
    i32.const 255
    i32.const 0
    local.get 0
    i64.load offset=8
    i32.wrap_i64
    local.tee 1
    i32.load offset=8
    i32.const 0
    i32.gt_s
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 1
      local.get 1
      i32.load offset=8
      i32.const 1
      i32.sub
      call $~lib/typedarray/Uint8Array#__get
      i32.const 7
      i32.shr_u
      i32.const 1
      i32.eq
    else
      local.get 0
    end
    select
    local.set 3
    i32.const 4
    local.set 0
    loop  ;; label = @1
      local.get 1
      i32.load offset=8
      local.get 0
      i32.gt_s
      if  ;; label = @2
        local.get 1
        local.get 0
        call $~lib/typedarray/Uint8Array#__get
        local.get 3
        i32.ne
        if  ;; label = @3
          i32.const 8704
          local.get 1
          call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
          call $~lib/string/String#concat
          i32.const 8768
          call $~lib/string/String#concat
          i32.const 8816
          i32.const 150
          i32.const 9
          call $~lib/builtins/abort
          unreachable
        end
        local.get 0
        i32.const 1
        i32.add
        local.set 0
        br 1 (;@1;)
      end
    end
    i32.const 12
    i32.const 11
    call $~lib/rt/stub/__new
    i32.const 4
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray#constructor
    local.tee 0
    i32.const 0
    local.get 3
    call $~lib/typedarray/Uint8Array#__set
    local.get 0
    i32.const 1
    local.get 3
    call $~lib/typedarray/Uint8Array#__set
    local.get 0
    i32.const 2
    local.get 3
    call $~lib/typedarray/Uint8Array#__set
    local.get 0
    i32.const 3
    local.get 3
    call $~lib/typedarray/Uint8Array#__set
    local.get 0
    local.get 1
    local.get 0
    i32.load offset=8
    local.get 1
    i32.load offset=8
    i32.lt_s
    select
    i32.load offset=8
    local.set 3
    loop  ;; label = @1
      local.get 2
      local.get 3
      i32.lt_s
      if  ;; label = @2
        local.get 0
        local.get 2
        local.get 1
        local.get 2
        call $~lib/typedarray/Uint8Array#__get
        call $~lib/typedarray/Uint8Array#__set
        local.get 2
        i32.const 1
        i32.add
        local.set 2
        br 1 (;@1;)
      end
    end
    local.get 0
    i32.const 3
    call $~lib/typedarray/Uint8Array#__get
    i32.const 8
    i32.shl
    local.get 0
    i32.const 2
    call $~lib/typedarray/Uint8Array#__get
    i32.or
    i32.const 8
    i32.shl
    local.get 0
    i32.const 1
    call $~lib/typedarray/Uint8Array#__get
    i32.or
    i32.const 8
    i32.shl
    local.get 0
    i32.const 0
    call $~lib/typedarray/Uint8Array#__get
    i32.or)
  (func $generated/NonfungiblePositionManager/NonfungiblePositionManager/NonfungiblePositionManager#try_positions (type 1) (param i32 i32) (result i32)
    (local i64 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 1
    i32.const 20
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 3
    i32.load offset=4
    drop
    local.get 1
    i64.extend_i32_u
    local.set 2
    i32.const 16
    i32.const 19
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 4
    i32.store
    local.get 1
    local.get 2
    i64.store offset=8
    local.get 3
    i32.load offset=4
    local.get 1
    i32.store
    local.get 0
    i32.const 4848
    i32.const 4896
    local.get 3
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#tryCall
    local.tee 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 38
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      i32.const 0
      i32.store
      local.get 0
      return
    end
    local.get 0
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
    local.tee 8
    i32.const 0
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 9
    local.get 8
    i32.const 1
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 10
    local.get 8
    i32.const 2
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 11
    local.get 8
    i32.const 3
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
    local.set 12
    local.get 8
    i32.const 4
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    local.set 0
    local.get 8
    i32.const 5
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    local.set 1
    local.get 8
    i32.const 6
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toI32
    local.set 3
    local.get 8
    i32.const 7
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 4
    local.get 8
    i32.const 8
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 5
    local.get 8
    i32.const 9
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 6
    local.get 8
    i32.const 10
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 7
    local.get 8
    i32.const 11
    call $~lib/array/Array<~lib/string/String>#__get
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 8
    i32.const 48
    i32.const 37
    call $~lib/rt/stub/__new
    local.tee 13
    i32.const 0
    i32.store
    local.get 13
    i32.const 0
    i32.store offset=4
    local.get 13
    i32.const 0
    i32.store offset=8
    local.get 13
    i32.const 0
    i32.store offset=12
    local.get 13
    i32.const 0
    i32.store offset=16
    local.get 13
    i32.const 0
    i32.store offset=20
    local.get 13
    i32.const 0
    i32.store offset=24
    local.get 13
    i32.const 0
    i32.store offset=28
    local.get 13
    i32.const 0
    i32.store offset=32
    local.get 13
    i32.const 0
    i32.store offset=36
    local.get 13
    i32.const 0
    i32.store offset=40
    local.get 13
    i32.const 0
    i32.store offset=44
    local.get 13
    local.get 9
    i32.store
    local.get 13
    local.get 10
    i32.store offset=4
    local.get 13
    local.get 11
    i32.store offset=8
    local.get 13
    local.get 12
    i32.store offset=12
    local.get 13
    local.get 0
    i32.store offset=16
    local.get 13
    local.get 1
    i32.store offset=20
    local.get 13
    local.get 3
    i32.store offset=24
    local.get 13
    local.get 4
    i32.store offset=28
    local.get 13
    local.get 5
    i32.store offset=32
    local.get 13
    local.get 6
    i32.store offset=36
    local.get 13
    local.get 7
    i32.store offset=40
    local.get 13
    local.get 8
    i32.store offset=44
    i32.const 4
    i32.const 38
    call $~lib/rt/stub/__new
    local.tee 0
    i32.const 0
    i32.store
    local.get 0
    i32.const 0
    i32.store
    i32.const 4
    i32.const 39
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 13
    i32.store
    local.get 0
    local.get 1
    i32.store
    local.get 0)
  (func $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult.fromValue<~lib/@graphprotocol/graph-ts/common/numbers/Address> (type 0) (param i32) (result i32)
    (local i32 i32)
    i32.const 4
    i32.const 43
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    i32.const 0
    i32.store
    i32.const 4
    i32.const 44
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 1
    local.get 2
    i32.store
    local.get 1)
  (func $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set (type 2) (param i32 i32 i32)
    (local i32)
    block (result i32)  ;; label = @1
      loop  ;; label = @2
        local.get 0
        i32.load
        i32.load offset=12
        local.get 3
        i32.gt_s
        if  ;; label = @3
          local.get 0
          i32.load
          local.get 3
          call $~lib/array/Array<~lib/string/String>#__get
          i32.load
          local.get 1
          call $~lib/string/String.__eq
          if  ;; label = @4
            local.get 0
            i32.load
            local.get 3
            call $~lib/array/Array<~lib/string/String>#__get
            br 3 (;@1;)
          end
          local.get 3
          i32.const 1
          i32.add
          local.set 3
          br 1 (;@2;)
        end
      end
      i32.const 0
    end
    local.tee 3
    if  ;; label = @1
      local.get 3
      local.get 2
      i32.store offset=4
    else
      i32.const 8
      i32.const 8
      call $~lib/rt/stub/__new
      local.tee 3
      i32.const 0
      i32.store
      local.get 3
      i32.const 0
      i32.store offset=4
      local.get 3
      local.get 1
      i32.store
      local.get 3
      local.get 2
      i32.store offset=4
      local.get 0
      i32.load
      local.get 3
      call $~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.EventParam>#push
    end)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toString (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    if  ;; label = @1
      i32.const 9808
      i32.const 6064
      i32.const 93
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/util/number/itoa64 (type 13) (param i64) (result i32)
    (local i32 i32 i32 i32 i32)
    local.get 0
    i64.eqz
    if  ;; label = @1
      i32.const 6576
      return
    end
    i64.const 0
    local.get 0
    i64.sub
    local.get 0
    local.get 0
    i64.const 63
    i64.shr_u
    i32.wrap_i64
    local.tee 3
    select
    local.tee 0
    i64.const 4294967295
    i64.le_u
    if  ;; label = @1
      local.get 0
      i32.wrap_i64
      local.tee 1
      i32.const 100000
      i32.lt_u
      if (result i32)  ;; label = @2
        local.get 1
        i32.const 100
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 1
          i32.const 10
          i32.ge_u
          i32.const 1
          i32.add
        else
          local.get 1
          i32.const 10000
          i32.ge_u
          i32.const 3
          i32.add
          local.get 1
          i32.const 1000
          i32.ge_u
          i32.add
        end
      else
        local.get 1
        i32.const 10000000
        i32.lt_u
        if (result i32)  ;; label = @3
          local.get 1
          i32.const 1000000
          i32.ge_u
          i32.const 6
          i32.add
        else
          local.get 1
          i32.const 1000000000
          i32.ge_u
          i32.const 8
          i32.add
          local.get 1
          i32.const 100000000
          i32.ge_u
          i32.add
        end
      end
      local.get 3
      i32.add
      local.tee 4
      i32.const 1
      i32.shl
      i32.const 1
      call $~lib/rt/stub/__new
      local.tee 2
      local.get 1
      local.get 4
      call $~lib/util/number/utoa32_dec_lut
    else
      local.get 0
      i64.const 1000000000000000
      i64.lt_u
      if (result i32)  ;; label = @2
        local.get 0
        i64.const 1000000000000
        i64.lt_u
        if (result i32)  ;; label = @3
          local.get 0
          i64.const 100000000000
          i64.ge_u
          i32.const 10
          i32.add
          local.get 0
          i64.const 10000000000
          i64.ge_u
          i32.add
        else
          local.get 0
          i64.const 100000000000000
          i64.ge_u
          i32.const 13
          i32.add
          local.get 0
          i64.const 10000000000000
          i64.ge_u
          i32.add
        end
      else
        local.get 0
        i64.const 100000000000000000
        i64.lt_u
        if (result i32)  ;; label = @3
          local.get 0
          i64.const 10000000000000000
          i64.ge_u
          i32.const 16
          i32.add
        else
          local.get 0
          i64.const -8446744073709551616
          i64.ge_u
          i32.const 18
          i32.add
          local.get 0
          i64.const 1000000000000000000
          i64.ge_u
          i32.add
        end
      end
      local.get 3
      i32.add
      local.tee 1
      i32.const 1
      i32.shl
      i32.const 1
      call $~lib/rt/stub/__new
      local.set 2
      loop  ;; label = @2
        local.get 0
        i64.const 100000000
        i64.ge_u
        if  ;; label = @3
          local.get 1
          i32.const 4
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          local.get 2
          i32.add
          local.get 0
          local.get 0
          i64.const 100000000
          i64.div_u
          local.tee 0
          i64.const 100000000
          i64.mul
          i64.sub
          i32.wrap_i64
          local.tee 4
          i32.const 10000
          i32.rem_u
          local.tee 5
          i32.const 100
          i32.div_u
          i32.const 2
          i32.shl
          i32.const 6588
          i32.add
          i64.load32_u
          local.get 5
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 6588
          i32.add
          i64.load32_u
          i64.const 32
          i64.shl
          i64.or
          i64.store
          local.get 1
          i32.const 4
          i32.sub
          local.tee 1
          i32.const 1
          i32.shl
          local.get 2
          i32.add
          local.get 4
          i32.const 10000
          i32.div_u
          local.tee 4
          i32.const 100
          i32.div_u
          i32.const 2
          i32.shl
          i32.const 6588
          i32.add
          i64.load32_u
          local.get 4
          i32.const 100
          i32.rem_u
          i32.const 2
          i32.shl
          i32.const 6588
          i32.add
          i64.load32_u
          i64.const 32
          i64.shl
          i64.or
          i64.store
          br 1 (;@2;)
        end
      end
      local.get 2
      local.get 0
      i32.wrap_i64
      local.get 1
      call $~lib/util/number/utoa32_dec_lut
    end
    local.get 3
    if  ;; label = @1
      local.get 2
      i32.const 45
      i32.store16
    end
    local.get 2)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 (type 5) (param i32 i32 i32) (result i32)
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#toBigInt (type 0) (param i32) (result i32)
    local.get 0
    i32.load
    i32.const 7
    i32.ne
    if  ;; label = @1
      i32.const 10416
      i32.const 6064
      i32.const 98
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    i64.load offset=8
    i32.wrap_i64)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayData (type 0) (param i32) (result i32)
    (local i32 i32 i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      local.get 0
                      i32.load
                      local.tee 1
                      if  ;; label = @10
                        local.get 1
                        i32.const 1
                        i32.sub
                        br_table 1 (;@9;) 3 (;@7;) 4 (;@6;) 5 (;@5;) 6 (;@4;) 7 (;@3;) 8 (;@2;) 2 (;@8;) 2 (;@8;) 9 (;@1;)
                      end
                      local.get 0
                      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
                      return
                    end
                    local.get 0
                    i32.load
                    i32.const 5
                    i32.eq
                    if (result i32)  ;; label = @9
                      i32.const 0
                    else
                      local.get 0
                      i32.load
                      i32.const 1
                      i32.ne
                      if  ;; label = @10
                        i32.const 9872
                        i32.const 6064
                        i32.const 72
                        i32.const 5
                        call $~lib/builtins/abort
                        unreachable
                      end
                      local.get 0
                      i64.load offset=8
                      i32.wrap_i64
                    end
                    call $~lib/util/number/itoa32
                    return
                  end
                  local.get 0
                  i32.load
                  i32.const 5
                  i32.eq
                  if (result i64)  ;; label = @8
                    i64.const 0
                  else
                    local.get 0
                    i32.load
                    i32.const 8
                    i32.ne
                    if  ;; label = @9
                      i32.const 9936
                      i32.const 6064
                      i32.const 80
                      i32.const 5
                      call $~lib/builtins/abort
                      unreachable
                    end
                    local.get 0
                    i64.load offset=8
                  end
                  call $~lib/util/number/itoa64
                  return
                end
                local.get 0
                i32.load
                i32.const 2
                i32.ne
                if  ;; label = @7
                  i32.const 10000
                  i32.const 6064
                  i32.const 103
                  i32.const 5
                  call $~lib/builtins/abort
                  unreachable
                end
                local.get 0
                i64.load offset=8
                i32.wrap_i64
                call $~lib/@graphprotocol/graph-ts/common/numbers/bigDecimal.toString
                return
              end
              i32.const 10160
              i32.const 10192
              local.get 0
              i32.load
              i32.const 5
              i32.eq
              if (result i32)  ;; label = @6
                i32.const 0
              else
                local.get 0
                i32.load
                i32.const 3
                i32.ne
                if  ;; label = @7
                  i32.const 10080
                  i32.const 6064
                  i32.const 59
                  i32.const 5
                  call $~lib/builtins/abort
                  unreachable
                end
                local.get 0
                i64.load offset=8
                i64.const 0
                i64.ne
              end
              select
              return
            end
            local.get 0
            i32.load
            i32.const 4
            i32.ne
            if  ;; label = @5
              i32.const 10224
              i32.const 6064
              i32.const 108
              i32.const 5
              call $~lib/builtins/abort
              unreachable
            end
            local.get 0
            i64.load offset=8
            i32.wrap_i64
            local.tee 3
            i32.load offset=12
            local.tee 4
            i32.const 3
            i32.const 0
            call $~lib/rt/__newArray
            local.tee 1
            i32.load offset=4
            local.set 2
            i32.const 0
            local.set 0
            loop  ;; label = @5
              local.get 4
              local.get 3
              i32.load offset=12
              local.tee 5
              local.get 4
              local.get 5
              i32.lt_s
              select
              local.get 0
              i32.gt_s
              if  ;; label = @6
                local.get 0
                i32.const 2
                i32.shl
                local.tee 5
                local.get 2
                i32.add
                local.get 5
                local.get 3
                i32.load offset=4
                i32.add
                i32.load
                local.get 0
                local.get 3
                i32.const 10320
                i32.load
                call_indirect $0 (type 5)
                i32.store
                local.get 0
                i32.const 1
                i32.add
                local.set 0
                br 1 (;@5;)
              end
            end
            i32.const 10288
            local.get 1
            i32.load offset=4
            local.get 1
            i32.load offset=12
            i32.const 10352
            call $~lib/util/string/joinStringArray
            call $~lib/string/String#concat
            i32.const 10384
            call $~lib/string/String#concat
            return
          end
          i32.const 1232
          return
        end
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
        call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
        return
      end
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBigInt
      call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
      return
    end
    i32.const 10580
    local.get 0
    i32.load
    call $~lib/util/number/itoa32
    i32.store
    i32.const 10576
    i32.const 10572
    i32.load
    i32.const 2
    i32.shr_u
    i32.const 4256
    call $~lib/util/string/joinStringArray)
  (func $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind (type 0) (param i32) (result i32)
    i32.const 1484
    i32.load
    local.get 0
    i32.load
    i32.le_s
    if  ;; label = @1
      i32.const 10660
      local.get 0
      i32.load
      call $~lib/util/number/itoa32
      i32.store
      i32.const 10656
      i32.const 10652
      i32.load
      i32.const 2
      i32.shr_u
      i32.const 4256
      call $~lib/util/string/joinStringArray
      return
    end
    i32.const 1472
    local.get 0
    i32.load
    call $~lib/array/Array<~lib/string/String>#__get)
  (func $generated/schema/Position#save (type 8) (param i32)
    (local i32)
    local.get 0
    i32.const 9392
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 10768
      i32.const 5920
      i32.const 73
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 1
    if  ;; label = @1
      local.get 1
      i32.load
      if  ;; label = @2
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        local.set 0
        local.get 1
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        local.set 1
        i32.const 11044
        local.get 0
        i32.store
        i32.const 11052
        local.get 1
        i32.store
        i32.const 11040
        i32.const 11036
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 4256
        call $~lib/util/string/joinStringArray
        i32.const 5920
        i32.const 75
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 5728
      local.get 1
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
      local.get 0
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $src/nonfungible-position-manager/getOrInitPosition (type 1) (param i32 i32) (result i32)
    (local i64 i32 i32 i32 i32 i32)
    i32.const 5728
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.tee 3
    if  ;; label = @1
      local.get 3
      i32.const 5776
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 0
      if (result i32)  ;; label = @2
        local.get 0
        i32.load
        i32.const 5
        i32.eq
      else
        i32.const 1
      end
      if (result i32)  ;; label = @2
        i32.const 5808
        i32.const 5920
        i32.const 107
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      else
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      end
      local.tee 0
      i32.load offset=8
      i32.const 20
      i32.ne
      if  ;; label = @2
        i32.const 6356
        local.get 0
        i32.load offset=8
        call $~lib/util/number/itoa32
        i32.store
        i32.const 6352
        i32.const 6348
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 4256
        call $~lib/util/string/joinStringArray
        i32.const 8160
        i32.const 44
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      local.get 3
      i32.const 0
      local.get 0
      call $src/constants/isTrackedPool
      select
      return
    end
    local.get 0
    i32.load
    local.set 0
    i32.const 8
    i32.const 35
    call $~lib/rt/stub/__new
    i32.const 8272
    local.get 0
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#constructor
    local.tee 4
    local.get 1
    call $generated/NonfungiblePositionManager/NonfungiblePositionManager/NonfungiblePositionManager#try_positions
    local.tee 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
    local.set 3
    block (result i32)  ;; label = @1
      local.get 4
      i32.const 5136
      i32.const 5184
      i32.const 0
      i32.const 20
      i32.const 8944
      call $~lib/rt/__newArray
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#tryCall
      local.tee 0
      i32.load
      i32.eqz
      if  ;; label = @2
        i32.const 4
        i32.const 43
        call $~lib/rt/stub/__new
        local.tee 0
        i32.const 0
        i32.store
        local.get 0
        i32.const 0
        i32.store
        local.get 0
        br 1 (;@1;)
      end
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
      i32.const 0
      call $~lib/array/Array<~lib/string/String>#__get
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult.fromValue<~lib/@graphprotocol/graph-ts/common/numbers/Address>
    end
    local.tee 0
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 0
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
    local.set 0
    block (result i32)  ;; label = @1
      i32.const 8
      i32.const 45
      call $~lib/rt/stub/__new
      i32.const 8976
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#constructor
      local.set 5
      local.get 3
      i32.load offset=8
      local.set 6
      local.get 3
      i32.load offset=12
      local.set 0
      local.get 3
      i32.load offset=16
      local.set 7
      i32.const 3
      i32.const 20
      i32.const 0
      call $~lib/rt/__newArray
      local.tee 3
      i32.load offset=4
      drop
      local.get 6
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
      local.set 6
      local.get 3
      i32.load offset=4
      local.get 6
      i32.store
      local.get 0
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value.fromAddress
      local.set 0
      local.get 3
      i32.load offset=4
      local.get 0
      i32.store offset=4
      local.get 7
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 4
      i32.store
      local.get 0
      local.get 2
      i64.store offset=8
      local.get 3
      i32.load offset=4
      local.get 0
      i32.store offset=8
      local.get 5
      i32.load
      local.get 5
      i32.load offset=4
      i32.const 5248
      i32.const 5296
      local.get 3
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContractCall#constructor
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.call
      local.tee 0
      i32.eqz
      if  ;; label = @2
        i32.const 9040
        i32.const 9232
        call $~lib/string/String#concat
        i32.const 5248
        call $~lib/string/String#concat
        i32.const 9296
        call $~lib/string/String#concat
        i32.const 4704
        i32.const 682
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      local.get 0
      i32.const 0
      call $~lib/array/Array<~lib/string/String>#__get
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
      local.tee 0
    end
    call $src/constants/isTrackedPool
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    block (result i32)  ;; label = @1
      i32.const 1
      i32.const 20
      i32.const 0
      call $~lib/rt/__newArray
      local.tee 3
      i32.load offset=4
      drop
      local.get 1
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 19
      call $~lib/rt/stub/__new
      local.tee 5
      i32.const 4
      i32.store
      local.get 5
      local.get 2
      i64.store offset=8
      local.get 3
      i32.load offset=4
      local.get 5
      i32.store
      local.get 4
      i32.const 4064
      i32.const 4112
      local.get 3
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.SmartContract#tryCall
      local.tee 3
      i32.load
      i32.eqz
      if  ;; label = @2
        i32.const 4
        i32.const 43
        call $~lib/rt/stub/__new
        local.tee 3
        i32.const 0
        i32.store
        local.get 3
        i32.const 0
        i32.store
        local.get 3
        br 1 (;@1;)
      end
      local.get 3
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
      i32.const 0
      call $~lib/array/Array<~lib/string/String>#__get
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toAddress
      call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult.fromValue<~lib/@graphprotocol/graph-ts/common/numbers/Address>
    end
    local.tee 3
    i32.load
    i32.eqz
    if  ;; label = @1
      i32.const 0
      return
    end
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    local.set 1
    i32.const 4
    i32.const 32
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 4
    i32.const 9392
    block (result i32)  ;; label = @1
      local.get 1
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 1
      i32.const 0
      i32.store
      local.get 1
      local.get 2
      i64.store offset=8
      local.get 1
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 4
    i32.const 5776
    block (result i32)  ;; label = @1
      local.get 0
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 6
      i32.store
      local.get 0
      local.get 2
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    i32.const 9424
    local.get 3
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.CallResult<~lib/array/Array<~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value>>#get:value
    local.tee 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/@graphprotocol/graph-ts/index/store.get
    local.tee 1
    i32.eqz
    if  ;; label = @1
      i32.const 4
      i32.const 46
      call $~lib/rt/stub/__new
      call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
      local.tee 1
      i32.const 9392
      block (result i32)  ;; label = @2
        local.get 0
        i64.extend_i32_u
        local.set 2
        i32.const 16
        i32.const 6
        call $~lib/rt/stub/__new
        local.tee 0
        i32.const 6
        i32.store
        local.get 0
        local.get 2
        i64.store offset=8
        local.get 0
      end
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
      local.get 1
      i32.const 9392
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 0
      i32.eqz
      if  ;; label = @2
        i32.const 9456
        i32.const 5920
        i32.const 23
        i32.const 5
        call $~lib/builtins/abort
        unreachable
      end
      local.get 0
      if  ;; label = @2
        local.get 0
        i32.load
        i32.const 6
        i32.ne
        if  ;; label = @3
          local.get 0
          call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
          local.set 1
          local.get 0
          call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
          local.set 0
          i32.const 9764
          local.get 1
          i32.store
          i32.const 9772
          local.get 0
          i32.store
          i32.const 9760
          i32.const 9756
          i32.load
          i32.const 2
          i32.shr_u
          i32.const 4256
          call $~lib/util/string/joinStringArray
          i32.const 5920
          i32.const 25
          i32.const 7
          call $~lib/builtins/abort
          unreachable
        end
        i32.const 9424
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
        call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
        local.get 1
        call $~lib/@graphprotocol/graph-ts/index/store.set
      end
    end
    local.get 4
    i32.const 10688
    block (result i32)  ;; label = @1
      local.get 1
      i32.const 9392
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 0
      if (result i32)  ;; label = @2
        local.get 0
        i32.load
        i32.const 5
        i32.eq
      else
        i32.const 1
      end
      if (result i32)  ;; label = @2
        i32.const 5808
        i32.const 5920
        i32.const 46
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      else
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBytes
      end
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 6
      i32.store
      local.get 0
      local.get 2
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 4
    i32.const 10720
    block (result i32)  ;; label = @1
      i32.const 0
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 2
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 4
    i32.const 5488
    block (result i32)  ;; label = @1
      i32.const 0
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      i64.extend_i32_u
      local.set 2
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 2
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 4
    call $generated/schema/Position#save
    local.get 4)
  (func $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#plus (type 1) (param i32 i32) (result i32)
    local.get 0
    i32.eqz
    if  ;; label = @1
      i32.const 11088
      i32.const 8160
      i32.const 185
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/bigInt.plus)
  (func $generated/schema/Position#get:id (type 0) (param i32) (result i32)
    local.get 0
    i32.const 9392
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    if (result i32)  ;; label = @1
      local.get 0
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 5808
      i32.const 5920
      i32.const 94
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
    end)
  (func $src/nonfungible-position-manager/createPositionEvent (type 14) (param i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    (local i64 i32)
    local.get 2
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    i32.const 11296
    call $~lib/string/String#concat
    local.get 3
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/string/String#concat
    i32.const 11296
    call $~lib/string/String#concat
    local.get 0
    call $generated/schema/Position#get:id
    call $~lib/string/String#concat
    i32.const 11296
    call $~lib/string/String#concat
    local.get 1
    call $~lib/string/String#concat
    local.set 11
    i32.const 4
    i32.const 50
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    local.tee 3
    i32.const 9392
    block (result i32)  ;; label = @1
      local.get 11
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 11
      i32.const 0
      i32.store
      local.get 11
      local.get 10
      i64.store offset=8
      local.get 11
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11328
    block (result i32)  ;; label = @1
      local.get 0
      call $generated/schema/Position#get:id
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11376
    block (result i32)  ;; label = @1
      local.get 1
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 0
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11408
    block (result i32)  ;; label = @1
      local.get 2
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 6
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11440
    block (result i32)  ;; label = @1
      local.get 4
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11488
    block (result i32)  ;; label = @1
      local.get 5
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11536
    block (result i32)  ;; label = @1
      local.get 6
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 5536
    block (result i32)  ;; label = @1
      local.get 7
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 5584
    block (result i32)  ;; label = @1
      local.get 8
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 7
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 11568
    block (result i32)  ;; label = @1
      local.get 9
      i64.extend_i32_u
      local.set 10
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 0
      i32.const 6
      i32.store
      local.get 0
      local.get 10
      i64.store offset=8
      local.get 0
    end
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 3
    i32.const 9392
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 0
    i32.eqz
    if  ;; label = @1
      i32.const 11648
      i32.const 5920
      i32.const 173
      i32.const 5
      call $~lib/builtins/abort
      unreachable
    end
    local.get 0
    if  ;; label = @1
      local.get 0
      i32.load
      if  ;; label = @2
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayData
        local.set 1
        local.get 0
        call $~lib/@graphprotocol/graph-ts/common/value/Value#displayKind
        local.set 0
        i32.const 11940
        local.get 1
        i32.store
        i32.const 11948
        local.get 0
        i32.store
        i32.const 11936
        i32.const 11932
        i32.load
        i32.const 2
        i32.shr_u
        i32.const 4256
        call $~lib/util/string/joinStringArray
        i32.const 5920
        i32.const 175
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      end
      i32.const 11984
      local.get 0
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toString
      local.get 3
      call $~lib/@graphprotocol/graph-ts/index/store.set
    end)
  (func $src/nonfungible-position-manager/handleIncreaseLiquidity (type 8) (param i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i64)
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 1
    i32.const 0
    i32.store
    local.get 1
    local.get 0
    i32.store
    local.get 0
    local.get 1
    i32.load
    i32.load offset=24
    i32.const 0
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    call $src/nonfungible-position-manager/getOrInitPosition
    local.tee 1
    i32.eqz
    if  ;; label = @1
      return
    end
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 0
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    drop
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 1
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 7
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 2
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 8
    i32.const 4
    i32.const 33
    call $~lib/rt/stub/__new
    local.tee 2
    i32.const 0
    i32.store
    local.get 2
    local.get 0
    i32.store
    local.get 2
    i32.load
    i32.load offset=24
    i32.const 3
    call $~lib/array/Array<~lib/string/String>#__get
    i32.load offset=4
    call $~lib/@graphprotocol/graph-ts/chain/ethereum/ethereum.Value#toBigInt
    local.set 9
    block (result i32)  ;; label = @1
      local.get 1
      i32.const 10720
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
      local.tee 2
      if (result i32)  ;; label = @2
        local.get 2
        i32.load
        i32.const 5
        i32.eq
      else
        i32.const 1
      end
      if (result i32)  ;; label = @2
        i32.const 5808
        i32.const 5920
        i32.const 133
        i32.const 7
        call $~lib/builtins/abort
        unreachable
      else
        local.get 2
        call $~lib/@graphprotocol/graph-ts/common/value/Value#toBigInt
      end
      local.set 10
      i32.const 0
      call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
      local.set 5
      local.get 10
      i32.load offset=8
      i32.const 0
      i32.gt_s
      local.tee 2
      if  ;; label = @2
        local.get 10
        local.get 10
        i32.load offset=8
        i32.const 1
        i32.sub
        call $~lib/typedarray/Uint8Array#__get
        i32.const 7
        i32.shr_u
        i32.const 1
        i32.eq
        local.set 2
      end
      i32.const 1
      i32.const 0
      block (result i32)  ;; label = @2
        local.get 5
        i32.load offset=8
        i32.const 0
        i32.gt_s
        local.tee 3
        if  ;; label = @3
          local.get 5
          local.get 5
          i32.load offset=8
          i32.const 1
          i32.sub
          call $~lib/typedarray/Uint8Array#__get
          i32.const 7
          i32.shr_u
          i32.const 1
          i32.eq
          local.set 3
        end
        local.get 3
      end
      local.get 2
      select
      br_if 0 (;@1;)
      drop
      i32.const -1
      local.get 3
      i32.const 1
      local.get 2
      select
      i32.eqz
      br_if 0 (;@1;)
      drop
      local.get 10
      i32.load offset=8
      local.set 4
      loop  ;; label = @2
        local.get 4
        i32.const 0
        i32.gt_s
        if (result i32)  ;; label = @3
          local.get 2
          if (result i32)  ;; label = @4
            i32.const 1
          else
            local.get 10
            local.get 4
            i32.const 1
            i32.sub
            call $~lib/typedarray/Uint8Array#__get
          end
          if (result i32)  ;; label = @4
            local.get 2
            if (result i32)  ;; label = @5
              local.get 10
              local.get 4
              i32.const 1
              i32.sub
              call $~lib/typedarray/Uint8Array#__get
              i32.const 255
              i32.eq
            else
              i32.const 0
            end
          else
            i32.const 1
          end
        else
          i32.const 0
        end
        if  ;; label = @3
          local.get 4
          i32.const 1
          i32.sub
          local.set 4
          br 1 (;@2;)
        end
      end
      local.get 5
      i32.load offset=8
      local.set 6
      loop  ;; label = @2
        local.get 6
        i32.const 0
        i32.gt_s
        if (result i32)  ;; label = @3
          local.get 3
          if (result i32)  ;; label = @4
            i32.const 1
          else
            local.get 5
            local.get 6
            i32.const 1
            i32.sub
            call $~lib/typedarray/Uint8Array#__get
          end
          if (result i32)  ;; label = @4
            local.get 3
            if (result i32)  ;; label = @5
              local.get 5
              local.get 6
              i32.const 1
              i32.sub
              call $~lib/typedarray/Uint8Array#__get
              i32.const 255
              i32.eq
            else
              i32.const 0
            end
          else
            i32.const 1
          end
        else
          i32.const 0
        end
        if  ;; label = @3
          local.get 6
          i32.const 1
          i32.sub
          local.set 6
          br 1 (;@2;)
        end
      end
      i32.const -1
      i32.const 1
      local.get 2
      select
      local.get 4
      local.get 6
      i32.gt_s
      br_if 0 (;@1;)
      drop
      i32.const 1
      i32.const -1
      local.get 2
      select
      local.get 4
      local.get 6
      i32.lt_s
      br_if 0 (;@1;)
      drop
      i32.const 1
      local.set 2
      loop  ;; label = @2
        local.get 2
        local.get 4
        i32.le_s
        if  ;; label = @3
          i32.const -1
          local.get 10
          local.get 4
          local.get 2
          i32.sub
          local.tee 3
          call $~lib/typedarray/Uint8Array#__get
          local.get 5
          local.get 3
          call $~lib/typedarray/Uint8Array#__get
          i32.lt_u
          br_if 2 (;@1;)
          drop
          i32.const 1
          local.get 10
          local.get 4
          local.get 2
          i32.sub
          local.tee 3
          call $~lib/typedarray/Uint8Array#__get
          local.get 5
          local.get 3
          call $~lib/typedarray/Uint8Array#__get
          i32.gt_u
          br_if 2 (;@1;)
          drop
          local.get 2
          i32.const 1
          i32.add
          local.set 2
          br 1 (;@2;)
        end
      end
      i32.const 0
    end
    i32.eqz
    local.tee 3
    if  ;; label = @1
      local.get 0
      i32.load offset=16
      i32.load offset=40
      i64.extend_i32_u
      local.set 11
      i32.const 16
      i32.const 6
      call $~lib/rt/stub/__new
      local.tee 2
      i32.const 7
      i32.store
      local.get 2
      local.get 11
      i64.store offset=8
      local.get 1
      i32.const 10720
      local.get 2
      call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    end
    local.get 1
    local.tee 2
    i32.const 5488
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#get
    local.tee 4
    if (result i32)  ;; label = @1
      local.get 4
      i32.load
      i32.const 5
      i32.eq
    else
      i32.const 1
    end
    if (result i32)  ;; label = @1
      i32.const 5808
      i32.const 5920
      i32.const 146
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    else
      local.get 4
      call $~lib/@graphprotocol/graph-ts/common/value/Value#toBigInt
    end
    local.get 7
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#plus
    i64.extend_i32_u
    local.set 11
    i32.const 16
    i32.const 6
    call $~lib/rt/stub/__new
    local.tee 4
    i32.const 7
    i32.store
    local.get 4
    local.get 11
    i64.store offset=8
    local.get 2
    i32.const 5488
    local.get 4
    call $~lib/@graphprotocol/graph-ts/common/collections/TypedMap<~lib/string/String_~lib/@graphprotocol/graph-ts/common/value/Value>#set
    local.get 1
    call $generated/schema/Position#save
    local.get 1
    i32.const 11216
    i32.const 11248
    local.get 3
    select
    local.get 0
    i32.load offset=20
    local.tee 1
    i32.load
    local.get 0
    i32.load offset=4
    local.get 0
    i32.load offset=16
    local.tee 0
    i32.load offset=40
    local.get 0
    i32.load offset=28
    local.get 7
    local.get 8
    local.get 9
    local.get 1
    i32.load offset=8
    call $src/nonfungible-position-manager/createPositionEvent)
  (func $~lib/matchstick-as/assembly/assert/assert.fieldEquals (type 7) (param i32 i32 i32 i32)
    local.get 0
    local.get 1
    local.get 2
    local.get 3
    call $~lib/matchstick-as/assembly/assert/_assert.fieldEquals
    i32.eqz
    if  ;; label = @1
      i32.const 12032
      i32.const 12128
      i32.const 45
      i32.const 7
      call $~lib/builtins/abort
      unreachable
    end)
  (func $tests/helpers/getExpectedEventId (type 1) (param i32 i32) (result i32)
    i32.const 12224
    i32.const 11296
    call $~lib/string/String#concat
    i32.const 12336
    call $~lib/string/String#concat
    i32.const 11296
    call $~lib/string/String#concat
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/string/String#concat
    i32.const 11296
    call $~lib/string/String#concat
    local.get 1
    call $~lib/string/String#concat)
  (func $start:tests/duplicate-increase.test~anonymous|0~anonymous|1 (type 3)
    (local i32 i32 i32 i32 i32 i32 i32)
    i32.const 2001
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 0
    i32.const 1000
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 3
    i32.const 500
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 1
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 5
    i32.const 200
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 4
    i32.const 50
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 6
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 2
    global.get $tests/helpers/CONTRACT_ADDRESS
    local.get 0
    global.get $tests/helpers/USER_1
    call $tests/helpers/setupTrackedPoolMocks
    local.get 0
    local.get 3
    local.get 5
    local.get 4
    call $tests/helpers/createIncreaseLiquidityEvent
    local.set 4
    local.get 0
    local.get 1
    local.get 6
    local.get 2
    call $tests/helpers/createIncreaseLiquidityEvent
    local.set 2
    local.get 4
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    local.get 2
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 10688
    global.get $tests/helpers/USER_1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    local.get 3
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#plus
    local.set 2
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 5488
    local.get 2
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 11984
    local.get 0
    i32.const 11216
    call $tests/helpers/getExpectedEventId
    local.tee 2
    i32.const 11376
    i32.const 11216
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 11984
    local.get 2
    i32.const 11536
    local.get 3
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 11984
    local.get 0
    i32.const 11248
    call $tests/helpers/getExpectedEventId
    local.tee 2
    i32.const 11376
    i32.const 11248
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 11984
    local.get 2
    i32.const 11536
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 9392
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 5776
    i32.const 2432
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals)
  (func $start:tests/duplicate-increase.test~anonymous|0~anonymous|2 (type 3)
    (local i32 i32 i32 i32)
    i32.const 2002
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 0
    i32.const 1000
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 2
    i32.const 500
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 3
    i32.const 250
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 1
    global.get $tests/helpers/CONTRACT_ADDRESS
    local.get 0
    global.get $tests/helpers/USER_1
    call $tests/helpers/setupTrackedPoolMocks
    local.get 0
    local.get 2
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.const 200
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $tests/helpers/createIncreaseLiquidityEvent
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    local.get 0
    local.get 3
    i32.const 50
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $tests/helpers/createIncreaseLiquidityEvent
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    local.get 0
    local.get 1
    i32.const 25
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.const 50
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $tests/helpers/createIncreaseLiquidityEvent
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    local.get 2
    local.get 3
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#plus
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/numbers/BigInt#plus
    local.set 1
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 5488
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 10688
    global.get $tests/helpers/USER_1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 11984
    local.get 0
    i32.const 11216
    call $tests/helpers/getExpectedEventId
    i32.const 11376
    i32.const 11216
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals)
  (func $start:tests/duplicate-increase.test~anonymous|0~anonymous|3 (type 3)
    (local i32 i32 i32)
    i32.const 2003
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 0
    i32.const 2004
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 1
    i32.const 1000
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    local.set 2
    global.get $tests/helpers/CONTRACT_ADDRESS
    local.get 0
    global.get $tests/helpers/USER_1
    call $tests/helpers/setupTrackedPoolMocks
    global.get $tests/helpers/CONTRACT_ADDRESS
    local.get 1
    global.get $tests/helpers/USER_1
    call $tests/helpers/setupTrackedPoolMocks
    local.get 0
    local.get 2
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.const 200
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $tests/helpers/createIncreaseLiquidityEvent
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    local.get 1
    local.get 2
    i32.const 100
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    i32.const 200
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    call $tests/helpers/createIncreaseLiquidityEvent
    call $src/nonfungible-position-manager/handleIncreaseLiquidity
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 5488
    local.get 2
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 5488
    local.get 2
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 0
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 10688
    global.get $tests/helpers/USER_1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals
    i32.const 5728
    local.get 1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bigIntToString
    i32.const 10688
    global.get $tests/helpers/USER_1
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.bytesToHex
    call $~lib/matchstick-as/assembly/assert/assert.fieldEquals)
  (func $start:tests/duplicate-increase.test~anonymous|0 (type 3)
    i32.const 3856
    i32.load
    i32.const 3888
    call $~lib/matchstick-as/assembly/index/_registerHook
    i32.const 3936
    i32.const 0
    i32.const 12368
    i32.load
    call $~lib/matchstick-as/assembly/index/_registerTest
    i32.const 12400
    i32.const 0
    i32.const 12496
    i32.load
    call $~lib/matchstick-as/assembly/index/_registerTest
    i32.const 12528
    i32.const 0
    i32.const 12640
    i32.load
    call $~lib/matchstick-as/assembly/index/_registerTest)
  (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type (type 0) (param i32) (result i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            block  ;; label = @5
              block  ;; label = @6
                block  ;; label = @7
                  block  ;; label = @8
                    block  ;; label = @9
                      block  ;; label = @10
                        block  ;; label = @11
                          block  ;; label = @12
                            block  ;; label = @13
                              block  ;; label = @14
                                block  ;; label = @15
                                  block  ;; label = @16
                                    block  ;; label = @17
                                      block  ;; label = @18
                                        block  ;; label = @19
                                          block  ;; label = @20
                                            block  ;; label = @21
                                              block  ;; label = @22
                                                block  ;; label = @23
                                                  block  ;; label = @24
                                                    block  ;; label = @25
                                                      block  ;; label = @26
                                                        block  ;; label = @27
                                                          block  ;; label = @28
                                                            block  ;; label = @29
                                                              block  ;; label = @30
                                                                block  ;; label = @31
                                                                  block  ;; label = @32
                                                                    block  ;; label = @33
                                                                      block  ;; label = @34
                                                                        block  ;; label = @35
                                                                          block  ;; label = @36
                                                                            block  ;; label = @37
                                                                              block  ;; label = @38
                                                                                block  ;; label = @39
                                                                                  block  ;; label = @40
                                                                                    block  ;; label = @41
                                                                                      block  ;; label = @42
                                                                                        block  ;; label = @43
                                                                                          block  ;; label = @44
                                                                                            block  ;; label = @45
                                                                                              block  ;; label = @46
                                                                                                block  ;; label = @47
                                                                                                  block  ;; label = @48
                                                                                                    block  ;; label = @49
                                                                                                      block  ;; label = @50
                                                                                                        block  ;; label = @51
                                                                                                          block  ;; label = @52
                                                                                                            block  ;; label = @53
                                                                                                              block  ;; label = @54
                                                                                                                block  ;; label = @55
                                                                                                                  block  ;; label = @56
                                                                                                                    block  ;; label = @57
                                                                                                                      block  ;; label = @58
                                                                                                                        block  ;; label = @59
                                                                                                                          block  ;; label = @60
                                                                                                                            block  ;; label = @61
                                                                                                                              block  ;; label = @62
                                                                                                                                block  ;; label = @63
                                                                                                                                  block  ;; label = @64
                                                                                                                                    block  ;; label = @65
                                                                                                                                      block  ;; label = @66
                                                                                                                                        block  ;; label = @67
                                                                                                                                          block  ;; label = @68
                                                                                                                                            block  ;; label = @69
                                                                                                                                              block  ;; label = @70
                                                                                                                                                block  ;; label = @71
                                                                                                                                                  block  ;; label = @72
                                                                                                                                                    block  ;; label = @73
                                                                                                                                                      block  ;; label = @74
                                                                                                                                                        block  ;; label = @75
                                                                                                                                                          block  ;; label = @76
                                                                                                                                                            block  ;; label = @77
                                                                                                                                                              block  ;; label = @78
                                                                                                                                                                block  ;; label = @79
                                                                                                                                                                  block  ;; label = @80
                                                                                                                                                                    block  ;; label = @81
                                                                                                                                                                      block  ;; label = @82
                                                                                                                                                                        block  ;; label = @83
                                                                                                                                                                          block  ;; label = @84
                                                                                                                                                                            block  ;; label = @85
                                                                                                                                                                              block  ;; label = @86
                                                                                                                                                                                block  ;; label = @87
                                                                                                                                                                                  block  ;; label = @88
                                                                                                                                                                                    block  ;; label = @89
                                                                                                                                                                                      block  ;; label = @90
                                                                                                                                                                                        block  ;; label = @91
                                                                                                                                                                                          block  ;; label = @92
                                                                                                                                                                                            block  ;; label = @93
                                                                                                                                                                                              block  ;; label = @94
                                                                                                                                                                                                block  ;; label = @95
                                                                                                                                                                                                  block  ;; label = @96
                                                                                                                                                                                                    block  ;; label = @97
                                                                                                                                                                                                      block  ;; label = @98
                                                                                                                                                                                                        block  ;; label = @99
                                                                                                                                                                                                          block  ;; label = @100
                                                                                                                                                                                                            block  ;; label = @101
                                                                                                                                                                                                              block  ;; label = @102
                                                                                                                                                                                                                block  ;; label = @103
                                                                                                                                                                                                                  block  ;; label = @104
                                                                                                                                                                                                                    block  ;; label = @105
                                                                                                                                                                                                                      block  ;; label = @106
                                                                                                                                                                                                                        block  ;; label = @107
                                                                                                                                                                                                                          block  ;; label = @108
                                                                                                                                                                                                                            block  ;; label = @109
                                                                                                                                                                                                                              block  ;; label = @110
                                                                                                                                                                                                                                block  ;; label = @111
                                                                                                                                                                                                                                  block  ;; label = @112
                                                                                                                                                                                                                                    block  ;; label = @113
                                                                                                                                                                                                                                      block  ;; label = @114
                                                                                                                                                                                                                                        block  ;; label = @115
                                                                                                                                                                                                                                          block  ;; label = @116
                                                                                                                                                                                                                                            block  ;; label = @117
                                                                                                                                                                                                                                              block  ;; label = @118
                                                                                                                                                                                                                                                block  ;; label = @119
                                                                                                                                                                                                                                                  block  ;; label = @120
                                                                                                                                                                                                                                                    block  ;; label = @121
                                                                                                                                                                                                                                                      block  ;; label = @122
                                                                                                                                                                                                                                                        block  ;; label = @123
                                                                                                                                                                                                                                                          block  ;; label = @124
                                                                                                                                                                                                                                                            block  ;; label = @125
                                                                                                                                                                                                                                                              block  ;; label = @126
                                                                                                                                                                                                                                                                block  ;; label = @127
                                                                                                                                                                                                                                                                  block  ;; label = @128
                                                                                                                                                                                                                                                                    block  ;; label = @129
                                                                                                                                                                                                                                                                      block  ;; label = @130
                                                                                                                                                                                                                                                                        block  ;; label = @131
                                                                                                                                                                                                                                                                          block  ;; label = @132
                                                                                                                                                                                                                                                                            block  ;; label = @133
                                                                                                                                                                                                                                                                              block  ;; label = @134
                                                                                                                                                                                                                                                                                block  ;; label = @135
                                                                                                                                                                                                                                                                                  block  ;; label = @136
                                                                                                                                                                                                                                                                                    block  ;; label = @137
                                                                                                                                                                                                                                                                                      block  ;; label = @138
                                                                                                                                                                                                                                                                                        block  ;; label = @139
                                                                                                                                                                                                                                                                                          block  ;; label = @140
                                                                                                                                                                                                                                                                                            block  ;; label = @141
                                                                                                                                                                                                                                                                                              block  ;; label = @142
                                                                                                                                                                                                                                                                                                block  ;; label = @143
                                                                                                                                                                                                                                                                                                  block  ;; label = @144
                                                                                                                                                                                                                                                                                                    block  ;; label = @145
                                                                                                                                                                                                                                                                                                      block  ;; label = @146
                                                                                                                                                                                                                                                                                                        block  ;; label = @147
                                                                                                                                                                                                                                                                                                          block  ;; label = @148
                                                                                                                                                                                                                                                                                                            block  ;; label = @149
                                                                                                                                                                                                                                                                                                              block  ;; label = @150
                                                                                                                                                                                                                                                                                                                block  ;; label = @151
                                                                                                                                                                                                                                                                                                                  block  ;; label = @152
                                                                                                                                                                                                                                                                                                                    block  ;; label = @153
                                                                                                                                                                                                                                                                                                                      block  ;; label = @154
                                                                                                                                                                                                                                                                                                                        block  ;; label = @155
                                                                                                                                                                                                                                                                                                                          block  ;; label = @156
                                                                                                                                                                                                                                                                                                                            block  ;; label = @157
                                                                                                                                                                                                                                                                                                                              block  ;; label = @158
                                                                                                                                                                                                                                                                                                                                block  ;; label = @159
                                                                                                                                                                                                                                                                                                                                  block  ;; label = @160
                                                                                                                                                                                                                                                                                                                                    block  ;; label = @161
                                                                                                                                                                                                                                                                                                                                      block  ;; label = @162
                                                                                                                                                                                                                                                                                                                                        block  ;; label = @163
                                                                                                                                                                                                                                                                                                                                          block  ;; label = @164
                                                                                                                                                                                                                                                                                                                                            block  ;; label = @165
                                                                                                                                                                                                                                                                                                                                              block  ;; label = @166
                                                                                                                                                                                                                                                                                                                                                local.get 0
                                                                                                                                                                                                                                                                                                                                                if  ;; label = @167
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 1 (;@166;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 2 (;@165;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 3 (;@164;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 4
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 4 (;@163;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 5
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 5 (;@162;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 6
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 6 (;@161;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 7
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 7 (;@160;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 8
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 8 (;@159;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 9
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 9 (;@158;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 10
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 10 (;@157;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 11
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 11 (;@156;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 12
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 12 (;@155;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 13
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 13 (;@154;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 14
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 14 (;@153;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 15
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 15 (;@152;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 16
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 16 (;@151;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 17
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 17 (;@150;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 18
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 18 (;@149;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 19
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 19 (;@148;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 20
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 20 (;@147;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 21
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 21 (;@146;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 27
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 22 (;@145;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 28
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 23 (;@144;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 29
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 24 (;@143;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 22
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 25 (;@142;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 23
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 26 (;@141;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 24
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 27 (;@140;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 25
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 28 (;@139;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 26
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 29 (;@138;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 30
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 30 (;@137;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 31
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 31 (;@136;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 32
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 32 (;@135;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 33
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 33 (;@134;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 34
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 34 (;@133;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 35
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 35 (;@132;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 36
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 36 (;@131;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 37
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 37 (;@130;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 38
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 38 (;@129;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 39
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 39 (;@128;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 40
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 40 (;@127;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 41
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 41 (;@126;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 42
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 42 (;@125;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 43
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 43 (;@124;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 44
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 44 (;@123;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 45
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 45 (;@122;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 46
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 46 (;@121;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 47
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 47 (;@120;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 48
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 48 (;@119;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 49
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 49 (;@118;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 50
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 50 (;@117;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 51
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 51 (;@116;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 52
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 52 (;@115;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 53
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 53 (;@114;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 54
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 54 (;@113;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 55
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 55 (;@112;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 56
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 56 (;@111;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 57
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 57 (;@110;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 58
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 58 (;@109;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 59
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 59 (;@108;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 60
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 60 (;@107;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 61
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 61 (;@106;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 63
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 62 (;@105;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 64
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 63 (;@104;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 65
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 64 (;@103;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 66
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 65 (;@102;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 67
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 66 (;@101;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 68
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 67 (;@100;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 69
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 68 (;@99;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 70
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 69 (;@98;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 71
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 70 (;@97;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 72
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 71 (;@96;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 73
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 72 (;@95;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 74
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 73 (;@94;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 75
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 74 (;@93;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 76
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 75 (;@92;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 77
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 76 (;@91;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 78
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 77 (;@90;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 79
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 78 (;@89;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 80
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 79 (;@88;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 81
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 80 (;@87;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 82
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 81 (;@86;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 83
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 82 (;@85;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 84
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 83 (;@84;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 85
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 84 (;@83;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 86
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 85 (;@82;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1000
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 86 (;@81;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1001
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 87 (;@80;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1002
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 88 (;@79;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1003
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 89 (;@78;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 90 (;@77;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 91 (;@76;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 92 (;@75;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 93 (;@74;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 94 (;@73;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1505
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 95 (;@72;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1506
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 96 (;@71;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1507
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 97 (;@70;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1508
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 98 (;@69;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1509
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 99 (;@68;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1510
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 100 (;@67;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1511
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 101 (;@66;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1512
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 102 (;@65;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1513
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 103 (;@64;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1514
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 104 (;@63;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1515
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 105 (;@62;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1516
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 106 (;@61;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1517
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 107 (;@60;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1518
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 108 (;@59;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1519
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 109 (;@58;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1520
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 110 (;@57;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1521
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 111 (;@56;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1522
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 112 (;@55;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1523
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 113 (;@54;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1524
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 114 (;@53;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1525
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 115 (;@52;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1526
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 116 (;@51;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1527
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 117 (;@50;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1528
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 118 (;@49;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1529
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 119 (;@48;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1530
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 120 (;@47;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1531
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 121 (;@46;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1532
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 122 (;@45;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1533
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 123 (;@44;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1534
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 124 (;@43;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1535
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 125 (;@42;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1536
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 126 (;@41;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1537
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 127 (;@40;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1538
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 128 (;@39;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1539
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 129 (;@38;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1540
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 130 (;@37;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1541
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 131 (;@36;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1542
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 132 (;@35;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1543
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 133 (;@34;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1544
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 134 (;@33;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1545
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 135 (;@32;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1546
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 136 (;@31;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1547
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 137 (;@30;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1548
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 138 (;@29;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1549
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 139 (;@28;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1550
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 140 (;@27;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1551
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 141 (;@26;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1552
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 142 (;@25;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1553
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 143 (;@24;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1554
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 144 (;@23;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1555
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 145 (;@22;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1556
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 146 (;@21;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1557
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 147 (;@20;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1558
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 148 (;@19;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1559
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 149 (;@18;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1560
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 150 (;@17;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1561
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 151 (;@16;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1562
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 152 (;@15;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 1563
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 153 (;@14;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 154 (;@13;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 155 (;@12;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 156 (;@11;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 157 (;@10;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 158 (;@9;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2505
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 159 (;@8;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 2506
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 160 (;@7;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3500
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 161 (;@6;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3501
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 162 (;@5;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3502
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 163 (;@4;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3503
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 164 (;@3;)
                                                                                                                                                                                                                                                                                                                                                  local.get 0
                                                                                                                                                                                                                                                                                                                                                  i32.const 3504
                                                                                                                                                                                                                                                                                                                                                  i32.eq
                                                                                                                                                                                                                                                                                                                                                  br_if 165 (;@2;)
                                                                                                                                                                                                                                                                                                                                                  br 166 (;@1;)
                                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                                i32.const 1
                                                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                                              i32.const 0
                                                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                                            i32.const 51
                                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                                          i32.const 52
                                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                                        i32.const 53
                                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                                      i32.const 54
                                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                                    i32.const 13
                                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                                  i32.const 55
                                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                                i32.const 56
                                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                                              i32.const 57
                                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                                            i32.const 58
                                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                                          i32.const 59
                                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                                        i32.const 60
                                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                                      i32.const 62
                                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                                    i32.const 63
                                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                                  i32.const 65
                                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                                i32.const 67
                                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                                              i32.const 69
                                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                                            i32.const 3
                                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                                          i32.const 71
                                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                                        i32.const 73
                                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                                      i32.const 78
                                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                                    i32.const 79
                                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                                  i32.const 80
                                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                                i32.const 81
                                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                                              i32.const 82
                                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                                            i32.const 70
                                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                                          i32.const 86
                                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                                        i32.const 87
                                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                                      i32.const 88
                                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                                    i32.const 64
                                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                                  i32.const 66
                                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                                i32.const 68
                                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                                              i32.const 89
                                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                                            i32.const 74
                                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                                          i32.const 94
                                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                                        i32.const 75
                                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                                      i32.const 94
                                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                                    i32.const 95
                                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                                  i32.const 98
                                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                                i32.const 100
                                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                                              i32.const 101
                                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                                            i32.const 102
                                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                                          i32.const 103
                                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                                        i32.const 104
                                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                                      i32.const 105
                                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                                    i32.const 106
                                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                                  i32.const 16
                                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                                i32.const 107
                                                                                                                                                                                                                                                return
                                                                                                                                                                                                                                              end
                                                                                                                                                                                                                                              i32.const 108
                                                                                                                                                                                                                                              return
                                                                                                                                                                                                                                            end
                                                                                                                                                                                                                                            i32.const 109
                                                                                                                                                                                                                                            return
                                                                                                                                                                                                                                          end
                                                                                                                                                                                                                                          i32.const 110
                                                                                                                                                                                                                                          return
                                                                                                                                                                                                                                        end
                                                                                                                                                                                                                                        i32.const 112
                                                                                                                                                                                                                                        return
                                                                                                                                                                                                                                      end
                                                                                                                                                                                                                                      i32.const 92
                                                                                                                                                                                                                                      return
                                                                                                                                                                                                                                    end
                                                                                                                                                                                                                                    i32.const 114
                                                                                                                                                                                                                                    return
                                                                                                                                                                                                                                  end
                                                                                                                                                                                                                                  i32.const 115
                                                                                                                                                                                                                                  return
                                                                                                                                                                                                                                end
                                                                                                                                                                                                                                i32.const 120
                                                                                                                                                                                                                                return
                                                                                                                                                                                                                              end
                                                                                                                                                                                                                              i32.const 122
                                                                                                                                                                                                                              return
                                                                                                                                                                                                                            end
                                                                                                                                                                                                                            i32.const 124
                                                                                                                                                                                                                            return
                                                                                                                                                                                                                          end
                                                                                                                                                                                                                          i32.const 126
                                                                                                                                                                                                                          return
                                                                                                                                                                                                                        end
                                                                                                                                                                                                                        i32.const 127
                                                                                                                                                                                                                        return
                                                                                                                                                                                                                      end
                                                                                                                                                                                                                      i32.const 113
                                                                                                                                                                                                                      return
                                                                                                                                                                                                                    end
                                                                                                                                                                                                                    i32.const 119
                                                                                                                                                                                                                    return
                                                                                                                                                                                                                  end
                                                                                                                                                                                                                  i32.const 123
                                                                                                                                                                                                                  return
                                                                                                                                                                                                                end
                                                                                                                                                                                                                i32.const 128
                                                                                                                                                                                                                return
                                                                                                                                                                                                              end
                                                                                                                                                                                                              i32.const 129
                                                                                                                                                                                                              return
                                                                                                                                                                                                            end
                                                                                                                                                                                                            i32.const 127
                                                                                                                                                                                                            return
                                                                                                                                                                                                          end
                                                                                                                                                                                                          i32.const 111
                                                                                                                                                                                                          return
                                                                                                                                                                                                        end
                                                                                                                                                                                                        i32.const 130
                                                                                                                                                                                                        return
                                                                                                                                                                                                      end
                                                                                                                                                                                                      i32.const 131
                                                                                                                                                                                                      return
                                                                                                                                                                                                    end
                                                                                                                                                                                                    i32.const 132
                                                                                                                                                                                                    return
                                                                                                                                                                                                  end
                                                                                                                                                                                                  i32.const 133
                                                                                                                                                                                                  return
                                                                                                                                                                                                end
                                                                                                                                                                                                i32.const 134
                                                                                                                                                                                                return
                                                                                                                                                                                              end
                                                                                                                                                                                              i32.const 135
                                                                                                                                                                                              return
                                                                                                                                                                                            end
                                                                                                                                                                                            i32.const 137
                                                                                                                                                                                            return
                                                                                                                                                                                          end
                                                                                                                                                                                          i32.const 138
                                                                                                                                                                                          return
                                                                                                                                                                                        end
                                                                                                                                                                                        i32.const 139
                                                                                                                                                                                        return
                                                                                                                                                                                      end
                                                                                                                                                                                      i32.const 140
                                                                                                                                                                                      return
                                                                                                                                                                                    end
                                                                                                                                                                                    i32.const 116
                                                                                                                                                                                    return
                                                                                                                                                                                  end
                                                                                                                                                                                  i32.const 141
                                                                                                                                                                                  return
                                                                                                                                                                                end
                                                                                                                                                                                i32.const 121
                                                                                                                                                                                return
                                                                                                                                                                              end
                                                                                                                                                                              i32.const 142
                                                                                                                                                                              return
                                                                                                                                                                            end
                                                                                                                                                                            i32.const 118
                                                                                                                                                                            return
                                                                                                                                                                          end
                                                                                                                                                                          i32.const 125
                                                                                                                                                                          return
                                                                                                                                                                        end
                                                                                                                                                                        i32.const 143
                                                                                                                                                                        return
                                                                                                                                                                      end
                                                                                                                                                                      i32.const 144
                                                                                                                                                                      return
                                                                                                                                                                    end
                                                                                                                                                                    i32.const 90
                                                                                                                                                                    return
                                                                                                                                                                  end
                                                                                                                                                                  i32.const 91
                                                                                                                                                                  return
                                                                                                                                                                end
                                                                                                                                                                i32.const 63
                                                                                                                                                                return
                                                                                                                                                              end
                                                                                                                                                              i32.const 93
                                                                                                                                                              return
                                                                                                                                                            end
                                                                                                                                                            i32.const 145
                                                                                                                                                            return
                                                                                                                                                          end
                                                                                                                                                          i32.const 146
                                                                                                                                                          return
                                                                                                                                                        end
                                                                                                                                                        i32.const 92
                                                                                                                                                        return
                                                                                                                                                      end
                                                                                                                                                      i32.const 148
                                                                                                                                                      return
                                                                                                                                                    end
                                                                                                                                                    i32.const 151
                                                                                                                                                    return
                                                                                                                                                  end
                                                                                                                                                  i32.const 155
                                                                                                                                                  return
                                                                                                                                                end
                                                                                                                                                i32.const 154
                                                                                                                                                return
                                                                                                                                              end
                                                                                                                                              i32.const 171
                                                                                                                                              return
                                                                                                                                            end
                                                                                                                                            i32.const 176
                                                                                                                                            return
                                                                                                                                          end
                                                                                                                                          i32.const 178
                                                                                                                                          return
                                                                                                                                        end
                                                                                                                                        i32.const 186
                                                                                                                                        return
                                                                                                                                      end
                                                                                                                                      i32.const 170
                                                                                                                                      return
                                                                                                                                    end
                                                                                                                                    i32.const 188
                                                                                                                                    return
                                                                                                                                  end
                                                                                                                                  i32.const 182
                                                                                                                                  return
                                                                                                                                end
                                                                                                                                i32.const 189
                                                                                                                                return
                                                                                                                              end
                                                                                                                              i32.const 159
                                                                                                                              return
                                                                                                                            end
                                                                                                                            i32.const 16
                                                                                                                            return
                                                                                                                          end
                                                                                                                          i32.const 194
                                                                                                                          return
                                                                                                                        end
                                                                                                                        i32.const 147
                                                                                                                        return
                                                                                                                      end
                                                                                                                      i32.const 166
                                                                                                                      return
                                                                                                                    end
                                                                                                                    i32.const 149
                                                                                                                    return
                                                                                                                  end
                                                                                                                  i32.const 175
                                                                                                                  return
                                                                                                                end
                                                                                                                i32.const 165
                                                                                                                return
                                                                                                              end
                                                                                                              i32.const 193
                                                                                                              return
                                                                                                            end
                                                                                                            i32.const 157
                                                                                                            return
                                                                                                          end
                                                                                                          i32.const 196
                                                                                                          return
                                                                                                        end
                                                                                                        i32.const 152
                                                                                                        return
                                                                                                      end
                                                                                                      i32.const 153
                                                                                                      return
                                                                                                    end
                                                                                                    i32.const 199
                                                                                                    return
                                                                                                  end
                                                                                                  i32.const 158
                                                                                                  return
                                                                                                end
                                                                                                i32.const 156
                                                                                                return
                                                                                              end
                                                                                              i32.const 190
                                                                                              return
                                                                                            end
                                                                                            i32.const 195
                                                                                            return
                                                                                          end
                                                                                          i32.const 183
                                                                                          return
                                                                                        end
                                                                                        i32.const 164
                                                                                        return
                                                                                      end
                                                                                      i32.const 200
                                                                                      return
                                                                                    end
                                                                                    i32.const 162
                                                                                    return
                                                                                  end
                                                                                  i32.const 161
                                                                                  return
                                                                                end
                                                                                i32.const 172
                                                                                return
                                                                              end
                                                                              i32.const 174
                                                                              return
                                                                            end
                                                                            i32.const 173
                                                                            return
                                                                          end
                                                                          i32.const 160
                                                                          return
                                                                        end
                                                                        i32.const 169
                                                                        return
                                                                      end
                                                                      i32.const 191
                                                                      return
                                                                    end
                                                                    i32.const 185
                                                                    return
                                                                  end
                                                                  i32.const 192
                                                                  return
                                                                end
                                                                i32.const 16
                                                                return
                                                              end
                                                              i32.const 163
                                                              return
                                                            end
                                                            i32.const 16
                                                            return
                                                          end
                                                          i32.const 177
                                                          return
                                                        end
                                                        i32.const 150
                                                        return
                                                      end
                                                      i32.const 184
                                                      return
                                                    end
                                                    i32.const 202
                                                    return
                                                  end
                                                  i32.const 180
                                                  return
                                                end
                                                i32.const 181
                                                return
                                              end
                                              i32.const 179
                                              return
                                            end
                                            i32.const 168
                                            return
                                          end
                                          i32.const 197
                                          return
                                        end
                                        i32.const 167
                                        return
                                      end
                                      i32.const 203
                                      return
                                    end
                                    i32.const 187
                                    return
                                  end
                                  i32.const 198
                                  return
                                end
                                i32.const 204
                                return
                              end
                              i32.const 201
                              return
                            end
                            i32.const 205
                            return
                          end
                          i32.const 208
                          return
                        end
                        i32.const 206
                        return
                      end
                      i32.const 207
                      return
                    end
                    i32.const 209
                    return
                  end
                  i32.const 210
                  return
                end
                i32.const 211
                return
              end
              i32.const 212
              return
            end
            i32.const 213
            return
          end
          i32.const 16
          return
        end
        i32.const 214
        return
      end
      i32.const 92
      return
    end
    i32.const 0)
  (func $node_modules/@graphprotocol/graph-ts/global/global/allocate (type 0) (param i32) (result i32)
    local.get 0
    call $~lib/rt/stub/__alloc)
  (func $~start (type 3)
    (local i32 i32)
    global.get $~started
    if  ;; label = @1
      return
    end
    i32.const 1
    global.set $~started
    i32.const 12796
    global.set $~lib/rt/stub/offset
    i32.const 4
    i32.const 4
    call $~lib/rt/stub/__new
    call $~lib/@graphprotocol/graph-ts/common/collections/Entity#constructor
    drop
    i32.const 1904
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $~lib/matchstick-as/assembly/defaults/defaultAddress
    global.get $~lib/matchstick-as/assembly/defaults/defaultAddress
    global.set $~lib/matchstick-as/assembly/defaults/defaultAddressBytes
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    global.set $~lib/matchstick-as/assembly/defaults/defaultBigInt
    i32.const 1
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    global.set $~lib/matchstick-as/assembly/defaults/defaultIntBytes
    i32.const 2
    i32.const 15
    i32.const 0
    call $~lib/rt/__newArray
    local.tee 0
    i32.load offset=4
    drop
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    local.set 1
    local.get 0
    i32.load offset=4
    local.get 1
    i32.store
    i32.const 2544
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    local.set 1
    local.get 0
    i32.load offset=4
    local.get 1
    i32.store offset=4
    local.get 0
    global.set $src/constants/TARGET_POOLS
    i32.const 2432
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/TRACKED_POOL
    i32.const 2544
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 2656
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 2768
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/FACTORY_ADDRESS
    i32.const 2880
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/CONTRACT_ADDRESS
    i32.const 2992
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/TOKEN0
    i32.const 3104
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/TOKEN1
    i32.const 3000
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    global.set $tests/helpers/FEE
    i32.const 3216
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 3328
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 500
    call $~lib/@graphprotocol/graph-ts/common/collections/ByteArray.fromI32
    drop
    i32.const 3440
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    global.set $tests/helpers/USER_1
    i32.const 3552
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 3664
    call $~lib/@graphprotocol/graph-ts/common/conversion/typeConversion.stringToH160
    drop
    i32.const 3776
    i32.const 12672
    i32.load
    call $~lib/matchstick-as/assembly/index/_registerDescribe)
  (table $0 7 funcref)
  (memory (;0;) 1)
  (global $~lib/rt/stub/offset (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/assembly/defaults/defaultAddress (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/assembly/defaults/defaultAddressBytes (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/assembly/defaults/defaultBigInt (mut i32) (i32.const 0))
  (global $~lib/matchstick-as/assembly/defaults/defaultIntBytes (mut i32) (i32.const 0))
  (global $src/constants/TARGET_POOLS (mut i32) (i32.const 0))
  (global $tests/helpers/TRACKED_POOL (mut i32) (i32.const 0))
  (global $tests/helpers/FACTORY_ADDRESS (mut i32) (i32.const 0))
  (global $tests/helpers/CONTRACT_ADDRESS (mut i32) (i32.const 0))
  (global $tests/helpers/TOKEN0 (mut i32) (i32.const 0))
  (global $tests/helpers/TOKEN1 (mut i32) (i32.const 0))
  (global $tests/helpers/FEE (mut i32) (i32.const 0))
  (global $tests/helpers/USER_1 (mut i32) (i32.const 0))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.String i32 (i32.const 0))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBuffer i32 (i32.const 1))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int8Array i32 (i32.const 2))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int16Array i32 (i32.const 3))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int32Array i32 (i32.const 4))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Int64Array i32 (i32.const 5))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint8Array i32 (i32.const 6))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint16Array i32 (i32.const 7))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint32Array i32 (i32.const 8))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Uint64Array i32 (i32.const 9))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Float32Array i32 (i32.const 10))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Float64Array i32 (i32.const 11))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.BigDecimal i32 (i32.const 12))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBool i32 (i32.const 13))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayUint8Array i32 (i32.const 14))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayEthereumValue i32 (i32.const 15))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayStoreValue i32 (i32.const 16))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayJsonValue i32 (i32.const 17))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayString i32 (i32.const 18))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayEventParam i32 (i32.const 19))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayTypedMapEntryStringJsonValue i32 (i32.const 20))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayTypedMapEntryStringStoreValue i32 (i32.const 21))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.SmartContractCall i32 (i32.const 22))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EventParam i32 (i32.const 23))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumTransaction i32 (i32.const 24))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumBlock i32 (i32.const 25))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumCall i32 (i32.const 26))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedTypedMapStringJsonValue i32 (i32.const 27))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedBool i32 (i32.const 28))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.WrappedJsonValue i32 (i32.const 29))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumValue i32 (i32.const 30))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StoreValue i32 (i32.const 31))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.JsonValue i32 (i32.const 32))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.EthereumEvent i32 (i32.const 33))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapEntryStringStoreValue i32 (i32.const 34))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapEntryStringJsonValue i32 (i32.const 35))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringStoreValue i32 (i32.const 36))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringJsonValue i32 (i32.const 37))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TypedMapStringTypedMapStringJsonValue i32 (i32.const 38))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ResultTypedMapStringJsonValueBool i32 (i32.const 39))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ResultJsonValueBool i32 (i32.const 40))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU8 i32 (i32.const 41))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU16 i32 (i32.const 42))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU32 i32 (i32.const 43))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayU64 i32 (i32.const 44))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI8 i32 (i32.const 45))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI16 i32 (i32.const 46))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI32 i32 (i32.const 47))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayI64 i32 (i32.const 48))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayF32 i32 (i32.const 49))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayF64 i32 (i32.const 50))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayBigDecimal i32 (i32.const 51))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayDataReceiver i32 (i32.const 52))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayCryptoHash i32 (i32.const 53))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayActionValue i32 (i32.const 54))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearMerklePath i32 (i32.const 55))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayValidatorStake i32 (i32.const 56))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArraySlashedValidator i32 (i32.const 57))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArraySignature i32 (i32.const 58))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearArrayChunkHeader i32 (i32.const 59))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAccessKeyPermissionValue i32 (i32.const 60))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearActionValue i32 (i32.const 61))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDirection i32 (i32.const 62))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearPublicKey i32 (i32.const 63))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSignature i32 (i32.const 64))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFunctionCallPermission i32 (i32.const 65))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFullAccessPermission i32 (i32.const 66))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAccessKey i32 (i32.const 67))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDataReceiver i32 (i32.const 68))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearCreateAccountAction i32 (i32.const 69))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeployContractAction i32 (i32.const 70))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearFunctionCallAction i32 (i32.const 71))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearTransferAction i32 (i32.const 72))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearStakeAction i32 (i32.const 73))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearAddKeyAction i32 (i32.const 74))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeleteKeyAction i32 (i32.const 75))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearDeleteAccountAction i32 (i32.const 76))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearActionReceipt i32 (i32.const 77))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSuccessStatus i32 (i32.const 78))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearMerklePathItem i32 (i32.const 79))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearExecutionOutcome i32 (i32.const 80))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearSlashedValidator i32 (i32.const 81))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearBlockHeader i32 (i32.const 82))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearValidatorStake i32 (i32.const 83))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearChunkHeader i32 (i32.const 84))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearBlock i32 (i32.const 85))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.NearReceiptWithOutcome i32 (i32.const 86))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.TransactionReceipt i32 (i32.const 1000))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.Log i32 (i32.const 1001))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayH256 i32 (i32.const 1002))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArrayLog i32 (i32.const 1003))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAny i32 (i32.const 1500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAnyArray i32 (i32.const 1501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBytesArray i32 (i32.const 1502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCoinArray i32 (i32.const 1503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommitSigArray i32 (i32.const 1504))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventArray i32 (i32.const 1505))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventAttributeArray i32 (i32.const 1506))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceArray i32 (i32.const 1507))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoArray i32 (i32.const 1508))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignerInfoArray i32 (i32.const 1509))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxResultArray i32 (i32.const 1510))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorArray i32 (i32.const 1511))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorUpdateArray i32 (i32.const 1512))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosAuthInfo i32 (i32.const 1513))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlock i32 (i32.const 1514))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockId i32 (i32.const 1515))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockIdFlagEnum i32 (i32.const 1516))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosBlockParams i32 (i32.const 1517))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCoin i32 (i32.const 1518))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommit i32 (i32.const 1519))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCommitSig i32 (i32.const 1520))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosCompactBitArray i32 (i32.const 1521))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosConsensus i32 (i32.const 1522))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosConsensusParams i32 (i32.const 1523))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosDuplicateVoteEvidence i32 (i32.const 1524))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosDuration i32 (i32.const 1525))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvent i32 (i32.const 1526))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventAttribute i32 (i32.const 1527))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventData i32 (i32.const 1528))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEventVote i32 (i32.const 1529))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidence i32 (i32.const 1530))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceList i32 (i32.const 1531))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosEvidenceParams i32 (i32.const 1532))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosFee i32 (i32.const 1533))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosHeader i32 (i32.const 1534))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosHeaderOnlyBlock i32 (i32.const 1535))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosLightBlock i32 (i32.const 1536))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosLightClientAttackEvidence i32 (i32.const 1537))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfo i32 (i32.const 1538))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoMulti i32 (i32.const 1539))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosModeInfoSingle i32 (i32.const 1540))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosPartSetHeader i32 (i32.const 1541))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosPublicKey i32 (i32.const 1542))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseBeginBlock i32 (i32.const 1543))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseDeliverTx i32 (i32.const 1544))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosResponseEndBlock i32 (i32.const 1545))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignModeEnum i32 (i32.const 1546))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignedHeader i32 (i32.const 1547))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignedMsgTypeEnum i32 (i32.const 1548))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosSignerInfo i32 (i32.const 1549))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTimestamp i32 (i32.const 1550))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTip i32 (i32.const 1551))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTransactionData i32 (i32.const 1552))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTx i32 (i32.const 1553))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxBody i32 (i32.const 1554))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTxResult i32 (i32.const 1555))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidator i32 (i32.const 1556))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorParams i32 (i32.const 1557))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorSet i32 (i32.const 1558))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorSetUpdates i32 (i32.const 1559))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosValidatorUpdate i32 (i32.const 1560))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosVersionParams i32 (i32.const 1561))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosMessageData i32 (i32.const 1562))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.CosmosTransactionContext i32 (i32.const 1563))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveBlock i32 (i32.const 2500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveProofOfAccess i32 (i32.const 2501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTag i32 (i32.const 2502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTagArray i32 (i32.const 2503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransaction i32 (i32.const 2504))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransactionArray i32 (i32.const 2505))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.ArweaveTransactionWithBlockPtr i32 (i32.const 2506))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetBlock i32 (i32.const 3500))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetTransaction i32 (i32.const 3501))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetTransactionTypeEnum i32 (i32.const 3502))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetEvent i32 (i32.const 3503))
  (global $node_modules/@graphprotocol/graph-ts/global/global/TypeId.StarknetArrayBytes i32 (i32.const 3504))
  (global $~started (mut i32) (i32.const 0))
  (export "TypeId.String" (global 13))
  (export "TypeId.ArrayBuffer" (global 14))
  (export "TypeId.Int8Array" (global 15))
  (export "TypeId.Int16Array" (global 16))
  (export "TypeId.Int32Array" (global 17))
  (export "TypeId.Int64Array" (global 18))
  (export "TypeId.Uint8Array" (global 19))
  (export "TypeId.Uint16Array" (global 20))
  (export "TypeId.Uint32Array" (global 21))
  (export "TypeId.Uint64Array" (global 22))
  (export "TypeId.Float32Array" (global 23))
  (export "TypeId.Float64Array" (global 24))
  (export "TypeId.BigDecimal" (global 25))
  (export "TypeId.ArrayBool" (global 26))
  (export "TypeId.ArrayUint8Array" (global 27))
  (export "TypeId.ArrayEthereumValue" (global 28))
  (export "TypeId.ArrayStoreValue" (global 29))
  (export "TypeId.ArrayJsonValue" (global 30))
  (export "TypeId.ArrayString" (global 31))
  (export "TypeId.ArrayEventParam" (global 32))
  (export "TypeId.ArrayTypedMapEntryStringJsonValue" (global 33))
  (export "TypeId.ArrayTypedMapEntryStringStoreValue" (global 34))
  (export "TypeId.SmartContractCall" (global 35))
  (export "TypeId.EventParam" (global 36))
  (export "TypeId.EthereumTransaction" (global 37))
  (export "TypeId.EthereumBlock" (global 38))
  (export "TypeId.EthereumCall" (global 39))
  (export "TypeId.WrappedTypedMapStringJsonValue" (global 40))
  (export "TypeId.WrappedBool" (global 41))
  (export "TypeId.WrappedJsonValue" (global 42))
  (export "TypeId.EthereumValue" (global 43))
  (export "TypeId.StoreValue" (global 44))
  (export "TypeId.JsonValue" (global 45))
  (export "TypeId.EthereumEvent" (global 46))
  (export "TypeId.TypedMapEntryStringStoreValue" (global 47))
  (export "TypeId.TypedMapEntryStringJsonValue" (global 48))
  (export "TypeId.TypedMapStringStoreValue" (global 49))
  (export "TypeId.TypedMapStringJsonValue" (global 50))
  (export "TypeId.TypedMapStringTypedMapStringJsonValue" (global 51))
  (export "TypeId.ResultTypedMapStringJsonValueBool" (global 52))
  (export "TypeId.ResultJsonValueBool" (global 53))
  (export "TypeId.ArrayU8" (global 54))
  (export "TypeId.ArrayU16" (global 55))
  (export "TypeId.ArrayU32" (global 56))
  (export "TypeId.ArrayU64" (global 57))
  (export "TypeId.ArrayI8" (global 58))
  (export "TypeId.ArrayI16" (global 59))
  (export "TypeId.ArrayI32" (global 60))
  (export "TypeId.ArrayI64" (global 61))
  (export "TypeId.ArrayF32" (global 62))
  (export "TypeId.ArrayF64" (global 63))
  (export "TypeId.ArrayBigDecimal" (global 64))
  (export "TypeId.NearArrayDataReceiver" (global 65))
  (export "TypeId.NearArrayCryptoHash" (global 66))
  (export "TypeId.NearArrayActionValue" (global 67))
  (export "TypeId.NearMerklePath" (global 68))
  (export "TypeId.NearArrayValidatorStake" (global 69))
  (export "TypeId.NearArraySlashedValidator" (global 70))
  (export "TypeId.NearArraySignature" (global 71))
  (export "TypeId.NearArrayChunkHeader" (global 72))
  (export "TypeId.NearAccessKeyPermissionValue" (global 73))
  (export "TypeId.NearActionValue" (global 74))
  (export "TypeId.NearDirection" (global 75))
  (export "TypeId.NearPublicKey" (global 76))
  (export "TypeId.NearSignature" (global 77))
  (export "TypeId.NearFunctionCallPermission" (global 78))
  (export "TypeId.NearFullAccessPermission" (global 79))
  (export "TypeId.NearAccessKey" (global 80))
  (export "TypeId.NearDataReceiver" (global 81))
  (export "TypeId.NearCreateAccountAction" (global 82))
  (export "TypeId.NearDeployContractAction" (global 83))
  (export "TypeId.NearFunctionCallAction" (global 84))
  (export "TypeId.NearTransferAction" (global 85))
  (export "TypeId.NearStakeAction" (global 86))
  (export "TypeId.NearAddKeyAction" (global 87))
  (export "TypeId.NearDeleteKeyAction" (global 88))
  (export "TypeId.NearDeleteAccountAction" (global 89))
  (export "TypeId.NearActionReceipt" (global 90))
  (export "TypeId.NearSuccessStatus" (global 91))
  (export "TypeId.NearMerklePathItem" (global 92))
  (export "TypeId.NearExecutionOutcome" (global 93))
  (export "TypeId.NearSlashedValidator" (global 94))
  (export "TypeId.NearBlockHeader" (global 95))
  (export "TypeId.NearValidatorStake" (global 96))
  (export "TypeId.NearChunkHeader" (global 97))
  (export "TypeId.NearBlock" (global 98))
  (export "TypeId.NearReceiptWithOutcome" (global 99))
  (export "TypeId.TransactionReceipt" (global 100))
  (export "TypeId.Log" (global 101))
  (export "TypeId.ArrayH256" (global 102))
  (export "TypeId.ArrayLog" (global 103))
  (export "TypeId.CosmosAny" (global 104))
  (export "TypeId.CosmosAnyArray" (global 105))
  (export "TypeId.CosmosBytesArray" (global 106))
  (export "TypeId.CosmosCoinArray" (global 107))
  (export "TypeId.CosmosCommitSigArray" (global 108))
  (export "TypeId.CosmosEventArray" (global 109))
  (export "TypeId.CosmosEventAttributeArray" (global 110))
  (export "TypeId.CosmosEvidenceArray" (global 111))
  (export "TypeId.CosmosModeInfoArray" (global 112))
  (export "TypeId.CosmosSignerInfoArray" (global 113))
  (export "TypeId.CosmosTxResultArray" (global 114))
  (export "TypeId.CosmosValidatorArray" (global 115))
  (export "TypeId.CosmosValidatorUpdateArray" (global 116))
  (export "TypeId.CosmosAuthInfo" (global 117))
  (export "TypeId.CosmosBlock" (global 118))
  (export "TypeId.CosmosBlockId" (global 119))
  (export "TypeId.CosmosBlockIdFlagEnum" (global 120))
  (export "TypeId.CosmosBlockParams" (global 121))
  (export "TypeId.CosmosCoin" (global 122))
  (export "TypeId.CosmosCommit" (global 123))
  (export "TypeId.CosmosCommitSig" (global 124))
  (export "TypeId.CosmosCompactBitArray" (global 125))
  (export "TypeId.CosmosConsensus" (global 126))
  (export "TypeId.CosmosConsensusParams" (global 127))
  (export "TypeId.CosmosDuplicateVoteEvidence" (global 128))
  (export "TypeId.CosmosDuration" (global 129))
  (export "TypeId.CosmosEvent" (global 130))
  (export "TypeId.CosmosEventAttribute" (global 131))
  (export "TypeId.CosmosEventData" (global 132))
  (export "TypeId.CosmosEventVote" (global 133))
  (export "TypeId.CosmosEvidence" (global 134))
  (export "TypeId.CosmosEvidenceList" (global 135))
  (export "TypeId.CosmosEvidenceParams" (global 136))
  (export "TypeId.CosmosFee" (global 137))
  (export "TypeId.CosmosHeader" (global 138))
  (export "TypeId.CosmosHeaderOnlyBlock" (global 139))
  (export "TypeId.CosmosLightBlock" (global 140))
  (export "TypeId.CosmosLightClientAttackEvidence" (global 141))
  (export "TypeId.CosmosModeInfo" (global 142))
  (export "TypeId.CosmosModeInfoMulti" (global 143))
  (export "TypeId.CosmosModeInfoSingle" (global 144))
  (export "TypeId.CosmosPartSetHeader" (global 145))
  (export "TypeId.CosmosPublicKey" (global 146))
  (export "TypeId.CosmosResponseBeginBlock" (global 147))
  (export "TypeId.CosmosResponseDeliverTx" (global 148))
  (export "TypeId.CosmosResponseEndBlock" (global 149))
  (export "TypeId.CosmosSignModeEnum" (global 150))
  (export "TypeId.CosmosSignedHeader" (global 151))
  (export "TypeId.CosmosSignedMsgTypeEnum" (global 152))
  (export "TypeId.CosmosSignerInfo" (global 153))
  (export "TypeId.CosmosTimestamp" (global 154))
  (export "TypeId.CosmosTip" (global 155))
  (export "TypeId.CosmosTransactionData" (global 156))
  (export "TypeId.CosmosTx" (global 157))
  (export "TypeId.CosmosTxBody" (global 158))
  (export "TypeId.CosmosTxResult" (global 159))
  (export "TypeId.CosmosValidator" (global 160))
  (export "TypeId.CosmosValidatorParams" (global 161))
  (export "TypeId.CosmosValidatorSet" (global 162))
  (export "TypeId.CosmosValidatorSetUpdates" (global 163))
  (export "TypeId.CosmosValidatorUpdate" (global 164))
  (export "TypeId.CosmosVersionParams" (global 165))
  (export "TypeId.CosmosMessageData" (global 166))
  (export "TypeId.CosmosTransactionContext" (global 167))
  (export "TypeId.ArweaveBlock" (global 168))
  (export "TypeId.ArweaveProofOfAccess" (global 169))
  (export "TypeId.ArweaveTag" (global 170))
  (export "TypeId.ArweaveTagArray" (global 171))
  (export "TypeId.ArweaveTransaction" (global 172))
  (export "TypeId.ArweaveTransactionArray" (global 173))
  (export "TypeId.ArweaveTransactionWithBlockPtr" (global 174))
  (export "TypeId.StarknetBlock" (global 175))
  (export "TypeId.StarknetTransaction" (global 176))
  (export "TypeId.StarknetTransactionTypeEnum" (global 177))
  (export "TypeId.StarknetEvent" (global 178))
  (export "TypeId.StarknetArrayBytes" (global 179))
  (export "id_of_type" (func $node_modules/@graphprotocol/graph-ts/global/global/id_of_type))
  (export "allocate" (func $node_modules/@graphprotocol/graph-ts/global/global/allocate))
  (export "memory" (memory 0))
  (export "table" (table 0))
  (export "_start" (func $~start))
  (elem $0 (i32.const 1) func $start:tests/duplicate-increase.test~anonymous|0~anonymous|0 $~lib/@graphprotocol/graph-ts/common/value/Value#displayData~anonymous|0 $start:tests/duplicate-increase.test~anonymous|0~anonymous|1 $start:tests/duplicate-increase.test~anonymous|0~anonymous|2 $start:tests/duplicate-increase.test~anonymous|0~anonymous|3 $start:tests/duplicate-increase.test~anonymous|0)
  (data (;0;) (i32.const 1036) "\1c")
  (data (;1;) (i32.const 1048) "\01\00\00\00\0c\00\00\00S\00t\00r\00i\00n\00g")
  (data (;2;) (i32.const 1068) "\1c")
  (data (;3;) (i32.const 1080) "\01\00\00\00\06\00\00\00I\00n\00t")
  (data (;4;) (i32.const 1100) ",")
  (data (;5;) (i32.const 1112) "\01\00\00\00\14\00\00\00B\00i\00g\00D\00e\00c\00i\00m\00a\00l")
  (data (;6;) (i32.const 1148) "\1c")
  (data (;7;) (i32.const 1160) "\01\00\00\00\08\00\00\00b\00o\00o\00l")
  (data (;8;) (i32.const 1180) "\1c")
  (data (;9;) (i32.const 1192) "\01\00\00\00\0a\00\00\00A\00r\00r\00a\00y")
  (data (;10;) (i32.const 1212) "\1c")
  (data (;11;) (i32.const 1224) "\01\00\00\00\08\00\00\00n\00u\00l\00l")
  (data (;12;) (i32.const 1244) "\1c")
  (data (;13;) (i32.const 1256) "\01\00\00\00\0a\00\00\00B\00y\00t\00e\00s")
  (data (;14;) (i32.const 1276) "\1c")
  (data (;15;) (i32.const 1288) "\01\00\00\00\0c\00\00\00B\00i\00g\00I\00n\00t")
  (data (;16;) (i32.const 1308) "\1c")
  (data (;17;) (i32.const 1320) "\01\00\00\00\08\00\00\00I\00n\00t\008")
  (data (;18;) (i32.const 1340) ",")
  (data (;19;) (i32.const 1352) "\01\00\00\00\12\00\00\00T\00i\00m\00e\00s\00t\00a\00m\00p")
  (data (;20;) (i32.const 1388) "<")
  (data (;21;) (i32.const 1404) "(\00\00\00 \04\00\00@\04\00\00`\04\00\00\90\04\00\00\b0\04\00\00\d0\04\00\00\f0\04\00\00\10\05\00\000\05\00\00P\05")
  (data (;22;) (i32.const 1452) ",")
  (data (;23;) (i32.const 1464) "\03\00\00\00\10\00\00\00\80\05\00\00\80\05\00\00(\00\00\00\0a")
  (data (;24;) (i32.const 1500) "l")
  (data (;25;) (i32.const 1512) "\01\00\00\00T\00\00\000\00x\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000")
  (data (;26;) (i32.const 1612) ",")
  (data (;27;) (i32.const 1624) "\01\00\00\00\0e\00\00\00m\00a\00i\00n\00n\00e\00t")
  (data (;28;) (i32.const 1660) ",")
  (data (;29;) (i32.const 1672) "\01\00\00\00\1c\00\00\00I\00n\00v\00a\00l\00i\00d\00 \00l\00e\00n\00g\00t\00h")
  (data (;30;) (i32.const 1708) ",")
  (data (;31;) (i32.const 1720) "\01\00\00\00\1a\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;32;) (i32.const 1756) "<")
  (data (;33;) (i32.const 1768) "\01\00\00\00(\00\00\00A\00l\00l\00o\00c\00a\00t\00i\00o\00n\00 \00t\00o\00o\00 \00l\00a\00r\00g\00e")
  (data (;34;) (i32.const 1820) "<")
  (data (;35;) (i32.const 1832) "\01\00\00\00\1e\00\00\00~\00l\00i\00b\00/\00r\00t\00/\00s\00t\00u\00b\00.\00t\00s")
  (data (;36;) (i32.const 1884) "l")
  (data (;37;) (i32.const 1896) "\01\00\00\00T\00\00\000\00x\00A\001\006\000\008\001\00F\003\006\000\00e\003\008\004\007\000\000\006\00d\00B\006\006\000\00b\00a\00e\001\00c\006\00d\001\00b\002\00e\001\007\00e\00C\002\00A")
  (data (;38;) (i32.const 1996) "<")
  (data (;39;) (i32.const 2008) "\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00a\00r\00r\00a\00y\00b\00u\00f\00f\00e\00r\00.\00t\00s")
  (data (;40;) (i32.const 2060) "<")
  (data (;41;) (i32.const 2072) "\01\00\00\00$\00\00\00I\00n\00d\00e\00x\00 \00o\00u\00t\00 \00o\00f\00 \00r\00a\00n\00g\00e")
  (data (;42;) (i32.const 2124) "<")
  (data (;43;) (i32.const 2136) "\01\00\00\00$\00\00\00~\00l\00i\00b\00/\00t\00y\00p\00e\00d\00a\00r\00r\00a\00y\00.\00t\00s")
  (data (;44;) (i32.const 2188) "<")
  (data (;45;) (i32.const 2200) "\01\00\00\00 \00\00\00d\00e\00f\00a\00u\00l\00t\00_\00l\00o\00g\00_\00t\00y\00p\00e")
  (data (;46;) (i32.const 2252) "\9c")
  (data (;47;) (i32.const 2264) "\01\00\00\00\86\00\00\00Y\00o\00u\00 \00c\00a\00n\00'\00t\00 \00m\00o\00d\00i\00f\00y\00 \00a\00 \00M\00o\00c\00k\00e\00d\00F\00u\00n\00c\00t\00i\00o\00n\00 \00i\00n\00s\00t\00a\00n\00c\00e\00 \00a\00f\00t\00e\00r\00 \00i\00t\00 \00h\00a\00s\00 \00b\00e\00e\00n\00 \00s\00a\00v\00e\00d\00.")
  (data (;48;) (i32.const 2412) "l")
  (data (;49;) (i32.const 2424) "\01\00\00\00T\00\00\000\00x\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001\001")
  (data (;50;) (i32.const 2524) "l")
  (data (;51;) (i32.const 2536) "\01\00\00\00T\00\00\000\00x\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003\003")
  (data (;52;) (i32.const 2636) "l")
  (data (;53;) (i32.const 2648) "\01\00\00\00T\00\00\000\00x\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002\002")
  (data (;54;) (i32.const 2748) "l")
  (data (;55;) (i32.const 2760) "\01\00\00\00T\00\00\000\00x\001\00F\009\008\004\003\001\00c\008\00a\00D\009\008\005\002\003\006\003\001\00A\00E\004\00a\005\009\00f\002\006\007\003\004\006\00e\00a\003\001\00F\009\008\004")
  (data (;56;) (i32.const 2860) "l")
  (data (;57;) (i32.const 2872) "\01\00\00\00T\00\00\000\00x\00C\003\006\004\004\002\00b\004\00a\004\005\002\002\00E\008\007\001\003\009\009\00C\00D\007\001\007\00a\00B\00D\00D\008\004\007\00A\00b\001\001\00F\00E\008\008")
  (data (;58;) (i32.const 2972) "l")
  (data (;59;) (i32.const 2984) "\01\00\00\00T\00\00\000\00x\00A\000\00b\008\006\009\009\001\00c\006\002\001\008\00b\003\006\00c\001\00d\001\009\00D\004\00a\002\00e\009\00E\00b\000\00c\00E\003\006\000\006\00e\00B\004\008")
  (data (;60;) (i32.const 3084) "l")
  (data (;61;) (i32.const 3096) "\01\00\00\00T\00\00\000\00x\00C\000\002\00a\00a\00A\003\009\00b\002\002\003\00F\00E\008\00D\000\00A\000\00e\005\00C\004\00F\002\007\00e\00A\00D\009\000\008\003\00C\007\005\006\00C\00c\002")
  (data (;62;) (i32.const 3196) "l")
  (data (;63;) (i32.const 3208) "\01\00\00\00T\00\00\000\00x\00B\000\00b\008\006\009\009\001\00c\006\002\001\008\00b\003\006\00c\001\00d\001\009\00D\004\00a\002\00e\009\00E\00b\000\00c\00E\003\006\000\006\00e\00B\004\009")
  (data (;64;) (i32.const 3308) "l")
  (data (;65;) (i32.const 3320) "\01\00\00\00T\00\00\000\00x\00D\000\002\00a\00a\00A\003\009\00b\002\002\003\00F\00E\008\00D\000\00A\000\00e\005\00C\004\00F\002\007\00e\00A\00D\009\000\008\003\00C\007\005\006\00C\00c\003")
  (data (;66;) (i32.const 3420) "l")
  (data (;67;) (i32.const 3432) "\01\00\00\00T\00\00\000\00x\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000")
  (data (;68;) (i32.const 3532) "l")
  (data (;69;) (i32.const 3544) "\01\00\00\00T\00\00\000\00x\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001")
  (data (;70;) (i32.const 3644) "l")
  (data (;71;) (i32.const 3656) "\01\00\00\00T\00\00\000\00x\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002\003\004\005\006\007\008\009\000\001\002")
  (data (;72;) (i32.const 3756) "L")
  (data (;73;) (i32.const 3768) "\01\00\00\006\00\00\00D\00u\00p\00l\00i\00c\00a\00t\00e\00 \00I\00n\00c\00r\00e\00a\00s\00e\00 \00H\00a\00n\00d\00l\00i\00n\00g")
  (data (;74;) (i32.const 3836) "\1c")
  (data (;75;) (i32.const 3848) "\11\00\00\00\08\00\00\00\01")
  (data (;76;) (i32.const 3868) ",")
  (data (;77;) (i32.const 3880) "\01\00\00\00\14\00\00\00b\00e\00f\00o\00r\00e\00E\00a\00c\00h")
  (data (;78;) (i32.const 3916) "|")
  (data (;79;) (i32.const 3928) "\01\00\00\00`\00\00\00d\00o\00u\00b\00l\00e\00_\00i\00n\00c\00r\00e\00a\00s\00e\00_\00s\00a\00m\00e\00_\00b\00l\00o\00c\00k\00_\00n\00o\00_\00d\00u\00p\00l\00i\00c\00a\00t\00e\00_\00p\00o\00s\00i\00t\00i\00o\00n")
  (data (;80;) (i32.const 4044) ",")
  (data (;81;) (i32.const 4056) "\01\00\00\00\0e\00\00\00o\00w\00n\00e\00r\00O\00f")
  (data (;82;) (i32.const 4092) "L")
  (data (;83;) (i32.const 4104) "\01\00\00\004\00\00\00o\00w\00n\00e\00r\00O\00f\00(\00u\00i\00n\00t\002\005\006\00)\00:\00(\00a\00d\00d\00r\00e\00s\00s\00)")
  (data (;84;) (i32.const 4172) "\1c")
  (data (;85;) (i32.const 4204) "\1c")
  (data (;86;) (i32.const 4236) "\1c")
  (data (;87;) (i32.const 4248) "\01")
  (data (;88;) (i32.const 4268) "\5c")
  (data (;89;) (i32.const 4280) "\01\00\00\00J\00\00\00T\00o\00o\00 \00f\00e\00w\00 \00a\00r\00g\00u\00m\00e\00n\00t\00s\00 \00f\00o\00r\00 \00f\00o\00r\00m\00a\00t\00 \00s\00t\00r\00i\00n\00g\00:\00 ")
  (data (;90;) (i32.const 4364) "\5c")
  (data (;91;) (i32.const 4376) "\01\00\00\00D\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00c\00h\00s\00t\00i\00c\00k\00-\00a\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00l\00o\00g\00.\00t\00s")
  (data (;92;) (i32.const 4460) "|")
  (data (;93;) (i32.const 4472) "\01\00\00\00^\00\00\00E\00l\00e\00m\00e\00n\00t\00 \00t\00y\00p\00e\00 \00m\00u\00s\00t\00 \00b\00e\00 \00n\00u\00l\00l\00a\00b\00l\00e\00 \00i\00f\00 \00a\00r\00r\00a\00y\00 \00i\00s\00 \00h\00o\00l\00e\00y")
  (data (;94;) (i32.const 4588) "\5c")
  (data (;95;) (i32.const 4600) "\01\00\00\00J\00\00\00A\00d\00d\00r\00e\00s\00s\00 \00m\00u\00s\00t\00 \00c\00o\00n\00t\00a\00i\00n\00 \00e\00x\00a\00c\00t\00l\00y\00 \002\000\00 \00b\00y\00t\00e\00s")
  (data (;96;) (i32.const 4684) "l")
  (data (;97;) (i32.const 4696) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00h\00a\00i\00n\00/\00e\00t\00h\00e\00r\00e\00u\00m\00.\00t\00s")
  (data (;98;) (i32.const 4796) "\1c")
  (data (;99;) (i32.const 4828) ",")
  (data (;100;) (i32.const 4840) "\01\00\00\00\12\00\00\00p\00o\00s\00i\00t\00i\00o\00n\00s")
  (data (;101;) (i32.const 4876) "\ec")
  (data (;102;) (i32.const 4888) "\01\00\00\00\dc\00\00\00p\00o\00s\00i\00t\00i\00o\00n\00s\00(\00u\00i\00n\00t\002\005\006\00)\00:\00(\00u\00i\00n\00t\009\006\00,\00a\00d\00d\00r\00e\00s\00s\00,\00a\00d\00d\00r\00e\00s\00s\00,\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\004\00,\00i\00n\00t\002\004\00,\00i\00n\00t\002\004\00,\00u\00i\00n\00t\001\002\008\00,\00u\00i\00n\00t\002\005\006\00,\00u\00i\00n\00t\002\005\006\00,\00u\00i\00n\00t\001\002\008\00,\00u\00i\00n\00t\001\002\008\00)")
  (data (;103;) (i32.const 5116) ",")
  (data (;104;) (i32.const 5128) "\01\00\00\00\0e\00\00\00f\00a\00c\00t\00o\00r\00y")
  (data (;105;) (i32.const 5164) "<")
  (data (;106;) (i32.const 5176) "\01\00\00\00&\00\00\00f\00a\00c\00t\00o\00r\00y\00(\00)\00:\00(\00a\00d\00d\00r\00e\00s\00s\00)")
  (data (;107;) (i32.const 5228) ",")
  (data (;108;) (i32.const 5240) "\01\00\00\00\0e\00\00\00g\00e\00t\00P\00o\00o\00l")
  (data (;109;) (i32.const 5276) "l")
  (data (;110;) (i32.const 5288) "\01\00\00\00R\00\00\00g\00e\00t\00P\00o\00o\00l\00(\00a\00d\00d\00r\00e\00s\00s\00,\00a\00d\00d\00r\00e\00s\00s\00,\00u\00i\00n\00t\002\004\00)\00:\00(\00a\00d\00d\00r\00e\00s\00s\00)")
  (data (;111;) (i32.const 5388) "\1c")
  (data (;112;) (i32.const 5420) ",")
  (data (;113;) (i32.const 5432) "\01\00\00\00\0e\00\00\00t\00o\00k\00e\00n\00I\00d")
  (data (;114;) (i32.const 5468) ",")
  (data (;115;) (i32.const 5480) "\01\00\00\00\12\00\00\00l\00i\00q\00u\00i\00d\00i\00t\00y")
  (data (;116;) (i32.const 5516) ",")
  (data (;117;) (i32.const 5528) "\01\00\00\00\0e\00\00\00a\00m\00o\00u\00n\00t\000")
  (data (;118;) (i32.const 5564) ",")
  (data (;119;) (i32.const 5576) "\01\00\00\00\0e\00\00\00a\00m\00o\00u\00n\00t\001")
  (data (;120;) (i32.const 5612) "\5c")
  (data (;121;) (i32.const 5624) "\01\00\00\00J\00\00\00E\00t\00h\00e\00r\00e\00u\00m\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\00n\00t\00 \00o\00r\00 \00u\00i\00n\00t\00.")
  (data (;122;) (i32.const 5708) ",")
  (data (;123;) (i32.const 5720) "\01\00\00\00\10\00\00\00P\00o\00s\00i\00t\00i\00o\00n")
  (data (;124;) (i32.const 5756) "\1c")
  (data (;125;) (i32.const 5768) "\01\00\00\00\08\00\00\00p\00o\00o\00l")
  (data (;126;) (i32.const 5788) "l")
  (data (;127;) (i32.const 5800) "\01\00\00\00P\00\00\00C\00a\00n\00n\00o\00t\00 \00r\00e\00t\00u\00r\00n\00 \00n\00u\00l\00l\00 \00f\00o\00r\00 \00a\00 \00r\00e\00q\00u\00i\00r\00e\00d\00 \00f\00i\00e\00l\00d\00.")
  (data (;128;) (i32.const 5900) "<")
  (data (;129;) (i32.const 5912) "\01\00\00\00&\00\00\00g\00e\00n\00e\00r\00a\00t\00e\00d\00/\00s\00c\00h\00e\00m\00a\00.\00t\00s")
  (data (;130;) (i32.const 5964) "L")
  (data (;131;) (i32.const 5976) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00y\00t\00e\00 \00a\00r\00r\00a\00y\00.")
  (data (;132;) (i32.const 6044) "l")
  (data (;133;) (i32.const 6056) "\01\00\00\00X\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00v\00a\00l\00u\00e\00.\00t\00s")
  (data (;134;) (i32.const 6156) "<")
  (data (;135;) (i32.const 6168) "\01\00\00\00 \00\00\00B\00y\00t\00e\00s\00 \00o\00f\00 \00l\00e\00n\00g\00t\00h\00 ")
  (data (;136;) (i32.const 6220) "l")
  (data (;137;) (i32.const 6232) "\01\00\00\00T\00\00\00 \00c\00a\00n\00 \00n\00o\00t\00 \00b\00e\00 \00c\00o\00n\00v\00e\00r\00t\00e\00d\00 \00t\00o\00 \002\000\00 \00b\00y\00t\00e\00 \00a\00d\00d\00r\00e\00s\00s\00e\00s")
  (data (;138;) (i32.const 6332) "\1c")
  (data (;139;) (i32.const 6344) "\22\00\00\00\0c\00\00\00 \18\00\00\00\00\00\00`\18")
  (data (;140;) (i32.const 6364) "|")
  (data (;141;) (i32.const 6376) "\01\00\00\00d\00\00\00t\00o\00S\00t\00r\00i\00n\00g\00(\00)\00 \00r\00a\00d\00i\00x\00 \00a\00r\00g\00u\00m\00e\00n\00t\00 \00m\00u\00s\00t\00 \00b\00e\00 \00b\00e\00t\00w\00e\00e\00n\00 \002\00 \00a\00n\00d\00 \003\006")
  (data (;142;) (i32.const 6492) "<")
  (data (;143;) (i32.const 6504) "\01\00\00\00&\00\00\00~\00l\00i\00b\00/\00u\00t\00i\00l\00/\00n\00u\00m\00b\00e\00r\00.\00t\00s")
  (data (;144;) (i32.const 6556) "\1c")
  (data (;145;) (i32.const 6568) "\01\00\00\00\02\00\00\000")
  (data (;146;) (i32.const 6588) "0\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009")
  (data (;147;) (i32.const 6988) "\1c\04")
  (data (;148;) (i32.const 7000) "\01\00\00\00\00\04\00\000\000\000\001\000\002\000\003\000\004\000\005\000\006\000\007\000\008\000\009\000\00a\000\00b\000\00c\000\00d\000\00e\000\00f\001\000\001\001\001\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\00a\001\00b\001\00c\001\00d\001\00e\001\00f\002\000\002\001\002\002\002\003\002\004\002\005\002\006\002\007\002\008\002\009\002\00a\002\00b\002\00c\002\00d\002\00e\002\00f\003\000\003\001\003\002\003\003\003\004\003\005\003\006\003\007\003\008\003\009\003\00a\003\00b\003\00c\003\00d\003\00e\003\00f\004\000\004\001\004\002\004\003\004\004\004\005\004\006\004\007\004\008\004\009\004\00a\004\00b\004\00c\004\00d\004\00e\004\00f\005\000\005\001\005\002\005\003\005\004\005\005\005\006\005\007\005\008\005\009\005\00a\005\00b\005\00c\005\00d\005\00e\005\00f\006\000\006\001\006\002\006\003\006\004\006\005\006\006\006\007\006\008\006\009\006\00a\006\00b\006\00c\006\00d\006\00e\006\00f\007\000\007\001\007\002\007\003\007\004\007\005\007\006\007\007\007\008\007\009\007\00a\007\00b\007\00c\007\00d\007\00e\007\00f\008\000\008\001\008\002\008\003\008\004\008\005\008\006\008\007\008\008\008\009\008\00a\008\00b\008\00c\008\00d\008\00e\008\00f\009\000\009\001\009\002\009\003\009\004\009\005\009\006\009\007\009\008\009\009\009\00a\009\00b\009\00c\009\00d\009\00e\009\00f\00a\000\00a\001\00a\002\00a\003\00a\004\00a\005\00a\006\00a\007\00a\008\00a\009\00a\00a\00a\00b\00a\00c\00a\00d\00a\00e\00a\00f\00b\000\00b\001\00b\002\00b\003\00b\004\00b\005\00b\006\00b\007\00b\008\00b\009\00b\00a\00b\00b\00b\00c\00b\00d\00b\00e\00b\00f\00c\000\00c\001\00c\002\00c\003\00c\004\00c\005\00c\006\00c\007\00c\008\00c\009\00c\00a\00c\00b\00c\00c\00c\00d\00c\00e\00c\00f\00d\000\00d\001\00d\002\00d\003\00d\004\00d\005\00d\006\00d\007\00d\008\00d\009\00d\00a\00d\00b\00d\00c\00d\00d\00d\00e\00d\00f\00e\000\00e\001\00e\002\00e\003\00e\004\00e\005\00e\006\00e\007\00e\008\00e\009\00e\00a\00e\00b\00e\00c\00e\00d\00e\00e\00e\00f\00f\000\00f\001\00f\002\00f\003\00f\004\00f\005\00f\006\00f\007\00f\008\00f\009\00f\00a\00f\00b\00f\00c\00f\00d\00f\00e\00f\00f")
  (data (;149;) (i32.const 8044) "\5c")
  (data (;150;) (i32.const 8056) "\01\00\00\00H\00\00\000\001\002\003\004\005\006\007\008\009\00a\00b\00c\00d\00e\00f\00g\00h\00i\00j\00k\00l\00m\00n\00o\00p\00q\00r\00s\00t\00u\00v\00w\00x\00y\00z")
  (data (;151;) (i32.const 8140) "l")
  (data (;152;) (i32.const 8152) "\01\00\00\00\5c\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00n\00u\00m\00b\00e\00r\00s\00.\00t\00s")
  (data (;153;) (i32.const 8252) "L")
  (data (;154;) (i32.const 8264) "\01\00\00\004\00\00\00N\00o\00n\00f\00u\00n\00g\00i\00b\00l\00e\00P\00o\00s\00i\00t\00i\00o\00n\00M\00a\00n\00a\00g\00e\00r")
  (data (;155;) (i32.const 8332) "\5c")
  (data (;156;) (i32.const 8344) "\01\00\00\00F\00\00\00a\00c\00c\00e\00s\00s\00e\00d\00 \00v\00a\00l\00u\00e\00 \00o\00f\00 \00a\00 \00r\00e\00v\00e\00r\00t\00e\00d\00 \00c\00a\00l\00l\00,\00 ")
  (data (;157;) (i32.const 8428) "\9c")
  (data (;158;) (i32.const 8440) "\01\00\00\00\88\00\00\00p\00l\00e\00a\00s\00e\00 \00c\00h\00e\00c\00k\00 \00t\00h\00e\00 \00`\00r\00e\00v\00e\00r\00t\00e\00d\00`\00 \00f\00i\00e\00l\00d\00 \00b\00e\00f\00o\00r\00e\00 \00a\00c\00c\00e\00s\00s\00i\00n\00g\00 \00t\00h\00e\00 \00`\00v\00a\00l\00u\00e\00`\00 \00f\00i\00e\00l\00d")
  (data (;159;) (i32.const 8588) "\5c")
  (data (;160;) (i32.const 8600) "\01\00\00\00@\00\00\00E\00t\00h\00e\00r\00e\00u\00m\00 \00v\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00a\00d\00d\00r\00e\00s\00s")
  (data (;161;) (i32.const 8684) "<")
  (data (;162;) (i32.const 8696) "\01\00\00\00(\00\00\00o\00v\00e\00r\00f\00l\00o\00w\00 \00c\00o\00n\00v\00e\00r\00t\00i\00n\00g\00 ")
  (data (;163;) (i32.const 8748) ",")
  (data (;164;) (i32.const 8760) "\01\00\00\00\0e\00\00\00 \00t\00o\00 \00i\003\002")
  (data (;165;) (i32.const 8796) "|")
  (data (;166;) (i32.const 8808) "\01\00\00\00d\00\00\00~\00l\00i\00b\00/\00@\00g\00r\00a\00p\00h\00p\00r\00o\00t\00o\00c\00o\00l\00/\00g\00r\00a\00p\00h\00-\00t\00s\00/\00c\00o\00m\00m\00o\00n\00/\00c\00o\00l\00l\00e\00c\00t\00i\00o\00n\00s\00.\00t\00s")
  (data (;167;) (i32.const 8924) "\1c")
  (data (;168;) (i32.const 8956) "<")
  (data (;169;) (i32.const 8968) "\01\00\00\00 \00\00\00U\00n\00i\00s\00w\00a\00p\00V\003\00F\00a\00c\00t\00o\00r\00y")
  (data (;170;) (i32.const 9020) "\bc")
  (data (;171;) (i32.const 9032) "\01\00\00\00\a2\00\00\00C\00a\00l\00l\00 \00r\00e\00v\00e\00r\00t\00e\00d\00,\00 \00p\00r\00o\00b\00a\00b\00l\00y\00 \00b\00e\00c\00a\00u\00s\00e\00 \00a\00n\00 \00`\00a\00s\00s\00e\00r\00t\00`\00 \00o\00r\00 \00`\00r\00e\00q\00u\00i\00r\00e\00`\00 \00i\00n\00 \00t\00h\00e\00 \00c\00o\00n\00t\00r\00a\00c\00t\00 \00f\00a\00i\00l\00e\00d\00,\00 ")
  (data (;172;) (i32.const 9212) "<")
  (data (;173;) (i32.const 9224) "\01\00\00\00(\00\00\00c\00o\00n\00s\00i\00d\00e\00r\00 \00u\00s\00i\00n\00g\00 \00`\00t\00r\00y\00_")
  (data (;174;) (i32.const 9276) "\5c")
  (data (;175;) (i32.const 9288) "\01\00\00\00@\00\00\00`\00 \00t\00o\00 \00h\00a\00n\00d\00l\00e\00 \00t\00h\00i\00s\00 \00i\00n\00 \00t\00h\00e\00 \00m\00a\00p\00p\00i\00n\00g\00.")
  (data (;176;) (i32.const 9372) "\1c")
  (data (;177;) (i32.const 9384) "\01\00\00\00\04\00\00\00i\00d")
  (data (;178;) (i32.const 9404) "\1c")
  (data (;179;) (i32.const 9416) "\01\00\00\00\08\00\00\00U\00s\00e\00r")
  (data (;180;) (i32.const 9436) "\5c")
  (data (;181;) (i32.const 9448) "\01\00\00\00J\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00U\00s\00e\00r\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;182;) (i32.const 9532) "\9c")
  (data (;183;) (i32.const 9544) "\01\00\00\00\80\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00U\00s\00e\00r\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00B\00y\00t\00e\00s\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;184;) (i32.const 9692) ",")
  (data (;185;) (i32.const 9704) "\01\00\00\00\1a\00\00\00'\00 \00i\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 ")
  (data (;186;) (i32.const 9740) ",")
  (data (;187;) (i32.const 9752) "\22\00\00\00\14\00\00\00P%\00\00\00\00\00\00\f0%\00\00\00\00\00\00\a0\10")
  (data (;188;) (i32.const 9788) "<")
  (data (;189;) (i32.const 9800) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00s\00t\00r\00i\00n\00g\00.")
  (data (;190;) (i32.const 9852) "<")
  (data (;191;) (i32.const 9864) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\003\002\00.")
  (data (;192;) (i32.const 9916) "<")
  (data (;193;) (i32.const 9928) "\01\00\00\00(\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00i\006\004\00.")
  (data (;194;) (i32.const 9980) "L")
  (data (;195;) (i32.const 9992) "\01\00\00\004\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00D\00e\00c\00i\00m\00a\00l\00.")
  (data (;196;) (i32.const 10060) "L")
  (data (;197;) (i32.const 10072) "\01\00\00\00.\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00b\00o\00o\00l\00e\00a\00n\00.")
  (data (;198;) (i32.const 10140) "\1c")
  (data (;199;) (i32.const 10152) "\01\00\00\00\08\00\00\00t\00r\00u\00e")
  (data (;200;) (i32.const 10172) "\1c")
  (data (;201;) (i32.const 10184) "\01\00\00\00\0a\00\00\00f\00a\00l\00s\00e")
  (data (;202;) (i32.const 10204) "<")
  (data (;203;) (i32.const 10216) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00n\00 \00a\00r\00r\00a\00y\00.")
  (data (;204;) (i32.const 10268) "\1c")
  (data (;205;) (i32.const 10280) "\01\00\00\00\02\00\00\00[")
  (data (;206;) (i32.const 10300) "\1c")
  (data (;207;) (i32.const 10312) "1\00\00\00\08\00\00\00\02")
  (data (;208;) (i32.const 10332) "\1c")
  (data (;209;) (i32.const 10344) "\01\00\00\00\04\00\00\00,\00 ")
  (data (;210;) (i32.const 10364) "\1c")
  (data (;211;) (i32.const 10376) "\01\00\00\00\02\00\00\00]")
  (data (;212;) (i32.const 10396) "<")
  (data (;213;) (i32.const 10408) "\01\00\00\00,\00\00\00V\00a\00l\00u\00e\00 \00i\00s\00 \00n\00o\00t\00 \00a\00 \00B\00i\00g\00I\00n\00t\00.")
  (data (;214;) (i32.const 10460) "<")
  (data (;215;) (i32.const 10472) "\01\00\00\00*\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00d\00a\00t\00a\00 \00(\00k\00i\00n\00d\00 \00=\00 ")
  (data (;216;) (i32.const 10524) "\1c")
  (data (;217;) (i32.const 10536) "\01\00\00\00\02\00\00\00)")
  (data (;218;) (i32.const 10556) "\1c")
  (data (;219;) (i32.const 10568) "\22\00\00\00\0c\00\00\00\f0(\00\00\00\00\00\000)")
  (data (;220;) (i32.const 10588) ",")
  (data (;221;) (i32.const 10600) "\01\00\00\00\12\00\00\00U\00n\00k\00n\00o\00w\00n\00 \00(")
  (data (;222;) (i32.const 10636) "\1c")
  (data (;223;) (i32.const 10648) "\22\00\00\00\0c\00\00\00p)\00\00\00\00\00\000)")
  (data (;224;) (i32.const 10668) "\1c")
  (data (;225;) (i32.const 10680) "\01\00\00\00\0a\00\00\00o\00w\00n\00e\00r")
  (data (;226;) (i32.const 10700) ",")
  (data (;227;) (i32.const 10712) "\01\00\00\00\12\00\00\00c\00r\00e\00a\00t\00e\00d\00A\00t")
  (data (;228;) (i32.const 10748) "l")
  (data (;229;) (i32.const 10760) "\01\00\00\00R\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00o\00s\00i\00t\00i\00o\00n\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;230;) (i32.const 10860) "\9c")
  (data (;231;) (i32.const 10872) "\01\00\00\00\8a\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00o\00s\00i\00t\00i\00o\00n\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00S\00t\00r\00i\00n\00g\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;232;) (i32.const 11020) ",")
  (data (;233;) (i32.const 11032) "\22\00\00\00\14\00\00\00\80*\00\00\00\00\00\00\f0%\00\00\00\00\00\00\a0\10")
  (data (;234;) (i32.const 11068) "|")
  (data (;235;) (i32.const 11080) "\01\00\00\00l\00\00\00F\00a\00i\00l\00e\00d\00 \00t\00o\00 \00s\00u\00m\00 \00B\00i\00g\00I\00n\00t\00s\00 \00b\00e\00c\00a\00u\00s\00e\00 \00l\00e\00f\00t\00 \00h\00a\00n\00d\00 \00s\00i\00d\00e\00 \00i\00s\00 \00'\00n\00u\00l\00l\00'")
  (data (;236;) (i32.const 11196) "\1c")
  (data (;237;) (i32.const 11208) "\01\00\00\00\08\00\00\00M\00I\00N\00T")
  (data (;238;) (i32.const 11228) ",")
  (data (;239;) (i32.const 11240) "\01\00\00\00\10\00\00\00I\00N\00C\00R\00E\00A\00S\00E")
  (data (;240;) (i32.const 11276) "\1c")
  (data (;241;) (i32.const 11288) "\01\00\00\00\02\00\00\00-")
  (data (;242;) (i32.const 11308) ",")
  (data (;243;) (i32.const 11320) "\01\00\00\00\10\00\00\00p\00o\00s\00i\00t\00i\00o\00n")
  (data (;244;) (i32.const 11356) "\1c")
  (data (;245;) (i32.const 11368) "\01\00\00\00\08\00\00\00t\00y\00p\00e")
  (data (;246;) (i32.const 11388) "\1c")
  (data (;247;) (i32.const 11400) "\01\00\00\00\0c\00\00\00t\00x\00H\00a\00s\00h")
  (data (;248;) (i32.const 11420) ",")
  (data (;249;) (i32.const 11432) "\01\00\00\00\12\00\00\00t\00i\00m\00e\00s\00t\00a\00m\00p")
  (data (;250;) (i32.const 11468) ",")
  (data (;251;) (i32.const 11480) "\01\00\00\00\16\00\00\00b\00l\00o\00c\00k\00N\00u\00m\00b\00e\00r")
  (data (;252;) (i32.const 11516) "\1c")
  (data (;253;) (i32.const 11528) "\01\00\00\00\0c\00\00\00a\00m\00o\00u\00n\00t")
  (data (;254;) (i32.const 11548) "\1c")
  (data (;255;) (i32.const 11560) "\01\00\00\00\0c\00\00\00s\00e\00n\00d\00e\00r")
  (data (;256;) (i32.const 11580) ",")
  (data (;257;) (i32.const 11592) "\01\00\00\00\12\00\00\00r\00e\00c\00i\00p\00i\00e\00n\00t")
  (data (;258;) (i32.const 11628) "l")
  (data (;259;) (i32.const 11640) "\01\00\00\00\5c\00\00\00C\00a\00n\00n\00o\00t\00 \00s\00a\00v\00e\00 \00P\00o\00s\00i\00t\00i\00o\00n\00E\00v\00e\00n\00t\00 \00e\00n\00t\00i\00t\00y\00 \00w\00i\00t\00h\00o\00u\00t\00 \00a\00n\00 \00I\00D")
  (data (;260;) (i32.const 11740) "\ac")
  (data (;261;) (i32.const 11752) "\01\00\00\00\94\00\00\00E\00n\00t\00i\00t\00i\00e\00s\00 \00o\00f\00 \00t\00y\00p\00e\00 \00P\00o\00s\00i\00t\00i\00o\00n\00E\00v\00e\00n\00t\00 \00m\00u\00s\00t\00 \00h\00a\00v\00e\00 \00a\00n\00 \00I\00D\00 \00o\00f\00 \00t\00y\00p\00e\00 \00S\00t\00r\00i\00n\00g\00 \00b\00u\00t\00 \00t\00h\00e\00 \00i\00d\00 \00'")
  (data (;262;) (i32.const 11916) ",")
  (data (;263;) (i32.const 11928) "\22\00\00\00\14\00\00\00\f0-\00\00\00\00\00\00\f0%\00\00\00\00\00\00\a0\10")
  (data (;264;) (i32.const 11964) ",")
  (data (;265;) (i32.const 11976) "\01\00\00\00\1a\00\00\00P\00o\00s\00i\00t\00i\00o\00n\00E\00v\00e\00n\00t")
  (data (;266;) (i32.const 12012) "\5c")
  (data (;267;) (i32.const 12024) "\01\00\00\00D\00\00\00a\00s\00s\00e\00r\00t\00.\00f\00i\00e\00l\00d\00E\00q\00u\00a\00l\00s\00 \00A\00s\00s\00e\00r\00t\00i\00o\00n\00 \00E\00r\00r\00o\00r")
  (data (;268;) (i32.const 12108) "\5c")
  (data (;269;) (i32.const 12120) "\01\00\00\00J\00\00\00~\00l\00i\00b\00/\00m\00a\00t\00c\00h\00s\00t\00i\00c\00k\00-\00a\00s\00/\00a\00s\00s\00e\00m\00b\00l\00y\00/\00a\00s\00s\00e\00r\00t\00.\00t\00s")
  (data (;270;) (i32.const 12204) "l")
  (data (;271;) (i32.const 12216) "\01\00\00\00T\00\00\000\00x\00a\001\006\000\008\001\00f\003\006\000\00e\003\008\004\007\000\000\006\00d\00b\006\006\000\00b\00a\00e\001\00c\006\00d\001\00b\002\00e\001\007\00e\00c\002\00a")
  (data (;272;) (i32.const 12316) "\1c")
  (data (;273;) (i32.const 12328) "\01\00\00\00\02\00\00\001")
  (data (;274;) (i32.const 12348) "\1c")
  (data (;275;) (i32.const 12360) "\11\00\00\00\08\00\00\00\03")
  (data (;276;) (i32.const 12380) "\5c")
  (data (;277;) (i32.const 12392) "\01\00\00\00J\00\00\00t\00r\00i\00p\00l\00e\00_\00i\00n\00c\00r\00e\00a\00s\00e\00_\00a\00c\00c\00u\00m\00u\00l\00a\00t\00e\00s\00_\00l\00i\00q\00u\00i\00d\00i\00t\00y")
  (data (;278;) (i32.const 12476) "\1c")
  (data (;279;) (i32.const 12488) "\11\00\00\00\08\00\00\00\04")
  (data (;280;) (i32.const 12508) "l")
  (data (;281;) (i32.const 12520) "\01\00\00\00\5c\00\00\00s\00a\00m\00e\00_\00b\00l\00o\00c\00k\00_\00d\00i\00f\00f\00e\00r\00e\00n\00t\00_\00t\00o\00k\00e\00n\00s\00_\00s\00e\00p\00a\00r\00a\00t\00e\00_\00p\00o\00s\00i\00t\00i\00o\00n\00s")
  (data (;282;) (i32.const 12620) "\1c")
  (data (;283;) (i32.const 12632) "\11\00\00\00\08\00\00\00\05")
  (data (;284;) (i32.const 12652) "\1c")
  (data (;285;) (i32.const 12664) "\11\00\00\00\08\00\00\00\06")
  (data (;286;) (i32.const 12684) "<")
  (data (;287;) (i32.const 12700) "(\00\00\00 \04\00\00@\04\00\00`\04\00\00\90\04\00\00\b0\04\00\00\d0\04\00\00\f0\04\00\00\10\05\00\000\05\00\00P\05")
  (data (;288;) (i32.const 12748) ",")
  (data (;289;) (i32.const 12760) "\03\00\00\00\10\00\00\00\a01\00\00\a01\00\00(\00\00\00\0a"))
