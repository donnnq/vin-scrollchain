// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiBankVaultSynchronizationDAO {
    address public validator;

    struct VaultSync {
        string bank;
        uint256 balance;
        string currency;
        uint256 timestamp;
    }

    VaultSync[] public syncs;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logSync(string memory _bank, uint256 _balance, string memory _currency) public onlyValidator {
        syncs.push(VaultSync(_bank, _balance, _currency, block.timestamp));
    }

    function getSync(uint256 index) public view returns (VaultSync memory) {
        return syncs[index];
    }

    function totalSyncs() public view returns (uint256) {
        return syncs.length;
    }
}
