// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract DAOToVaultAdoptionGrid {
    string public batchID = "1321.9.177";
    string public steward = "Vinvin";

    address public admin;

    struct VaultEvent {
        string vaultType;     // HashiCorp, AWS Secrets Manager, Azure Key Vault
        string action;        // adoption, rotation, migration
        uint256 timestamp;
    }

    VaultEvent[] public vaultEvents;

    event VaultLogged(string vaultType, string action);

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    function logVault(string memory vaultType, string memory action) public onlyAdmin {
        vaultEvents.push(VaultEvent(vaultType, action, block.timestamp));
        emit VaultLogged(vaultType, action);
    }

    function getVault(uint256 index) public view returns (string memory vaultType, string memory action, uint256 timestamp) {
        VaultEvent memory v = vaultEvents[index];
        return (v.vaultType, v.action, v.timestamp);
    }
}
