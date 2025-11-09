// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MultiBankVaultIntegrityMonitor {
    address public validator;

    struct VaultCheck {
        string institution;
        string vaultId;
        string status;
        uint256 timestamp;
    }

    VaultCheck[] public checks;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logCheck(string memory _institution, string memory _vaultId, string memory _status) public onlyValidator {
        checks.push(VaultCheck(_institution, _vaultId, _status, block.timestamp));
    }

    function getCheck(uint256 index) public view returns (VaultCheck memory) {
        return checks[index];
    }

    function totalChecks() public view returns (uint256) {
        return checks.length;
    }
}
