// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InsurrectionInvocationLedger {
    address public admin;

    struct InvocationEntry {
        string commentOrigin; // "Online forum", "Social media", "News comment section"
        string invocationSignal; // "Activate Insurrection Act", "Deploy federal troops", "Override local governance"
        string emotionalTag;
        bool invoked;
        bool sealed;
    }

    InvocationEntry[] public entries;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logInvocation(string memory commentOrigin, string memory invocationSignal, string memory emotionalTag) external onlyAdmin {
        entries.push(InvocationEntry(commentOrigin, invocationSignal, emotionalTag, true, false));
    }

    function sealInvocationEntry(uint256 index) external onlyAdmin {
        require(entries[index].invoked, "Must be invoked first");
        entries[index].sealed = true;
    }

    function getInvocationEntry(uint256 index) external view returns (InvocationEntry memory) {
        return entries[index];
    }
}
