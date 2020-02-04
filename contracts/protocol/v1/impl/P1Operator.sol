/*

    Copyright 2020 dYdX Trading Inc.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

*/

pragma solidity 0.5.16;
pragma experimental ABIEncoderV2;

import { P1Storage } from "./P1Storage.sol";


/**
 * @title P1Operator
 * @author dYdX
 *
 * Operator logic contract
 */
contract P1Operator is
    P1Storage
{
    // ============ Events ============

    event LogAddLocalOperator(
        address indexed sender,
        address operator
    );

    event LogRemoveLocalOperator(
        address indexed sender,
        address operator
    );

    // ============ Functions ============

    function addLocalOperator(
        address operator
    )
        external
    {
        _LOCAL_OPERATORS_[msg.sender][operator] = true;
        emit LogAddLocalOperator(msg.sender, operator);
    }

    function removeLocalOperator(
        address operator
    )
        external
    {
        _LOCAL_OPERATORS_[msg.sender][operator] = false;
        emit LogRemoveLocalOperator(msg.sender, operator);
    }
}