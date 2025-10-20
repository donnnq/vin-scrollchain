// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract JPMorganProvisionDAO {
    address public admin;

    struct ProvisionEntry {
        string institution;
        string provisionAmount;
        string riskSignal;
        string emotionalTag;
        bool summoned;
        bool confirmed;
        bool sealed;
    }

    ProvisionEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function summonProvision(string memory institution, string memory provisionAmount, string memory riskSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ProvisionEntry(institution, provisionAmount, riskSignal, emotionalTag, true, false, false));
    }

    function confirmProvision(uint256 index) external onlyAdmin {
        entries[index].confirmed = true;
    }

    function sealProvisionEntry(uint256 index) external onlyAdmin {
        require(entries[index].confirmed, "Must be confirmed first");
        entries[index].sealed = true;
    }

    function getProvisionEntry(uint256 index) external view returns (ProvisionEntry memory) {
        return entries[index];
    }
}
