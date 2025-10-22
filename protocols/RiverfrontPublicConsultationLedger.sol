// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract RiverfrontPublicConsultationLedger {
    address public admin;

    struct ConsultationEntry {
        string projectName; // "PAREX"
        string stakeholderGroup; // "Heritage advocates", "Environmentalists", "Cyclist coalitions"
        string consultationSignal; // "Design feedback", "Alignment objection", "Access proposal"
        string emotionalTag;
        bool consulted;
        bool sealed;
    }

    ConsultationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logConsultation(string memory projectName, string memory stakeholderGroup, string memory consultationSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(ConsultationEntry(projectName, stakeholderGroup, consultationSignal, emotionalTag, true, false));
    }

    function sealConsultationEntry(uint256 index) external onlyAdmin {
        require(entries[index].consulted, "Must be consulted first");
        entries[index].sealed = true;
    }

    function getConsultationEntry(uint256 index) external view returns (ConsultationEntry memory) {
        return entries[index];
    }
}
