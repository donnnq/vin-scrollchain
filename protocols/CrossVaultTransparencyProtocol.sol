// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract CrossVaultTransparencyProtocol {
    address public validator;

    struct Vault {
        string platform;
        uint256 balance;
        string assetType;
        uint256 timestamp;
    }

    Vault[] public vaults;

    modifier onlyValidator() {
        require(msg.sender == validator, "Not authorized");
        _;
    }

    constructor() {
        validator = msg.sender;
    }

    function logVault(string memory _platform, uint256 _balance, string memory _assetType) public onlyValidator {
        vaults.push(Vault(_platform, _balance, _assetType, block.timestamp));
    }

    function getVault(uint256 index) public view returns (Vault memory) {
        return vaults[index];
    }

    function totalVaults() public view returns (uint256) {
        return vaults.length;
    }
}
