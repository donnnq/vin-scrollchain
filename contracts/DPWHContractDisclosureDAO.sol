// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DPWHContractDisclosureDAO {
    address public admin;

    struct ContractEntry {
        string contractID;
        string projectLabel;
        string contractorName;
        string awardedAmount;
        string emotionalTag;
        bool published;
    }

    ContractEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory contractID, string memory projectLabel, string memory contractorName, string memory awardedAmount, string memory emotionalTag) external onlyAdmin {
        entries.push(ContractEntry(contractID, projectLabel, contractorName, awardedAmount, emotionalTag, false));
    }

    function publishEntry(uint256 index) external onlyAdmin {
        entries[index].published = true;
    }

    function getEntry(uint256 index) external view returns (ContractEntry memory) {
        return entries[index];
    }
}
