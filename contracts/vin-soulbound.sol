// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinSoulbound {
    address public immutable bearer;
    string public vow;

    constructor(string memory _vow) {
        bearer = msg.sender;
        vow = _vow;
    }

    function isSoulbound() external view returns (bool) {
        return msg.sender == bearer;
    }
}
