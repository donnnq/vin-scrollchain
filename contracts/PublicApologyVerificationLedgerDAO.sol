// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PublicApologyVerificationLedgerDAO {
    address public admin;

    struct ApologyEntry {
        string speaker;
        string incidentReference;
        string apologyText;
        string emotionalTag;
        bool verified;
    }

    ApologyEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitApology(string memory _speaker, string memory _incidentReference, string memory _apologyText, string memory _emotionalTag) external onlyAdmin {
        ledger.push(ApologyEntry(_speaker, _incidentReference, _apologyText, _emotionalTag, false));
    }

    function verifyApology(uint256 index) external onlyAdmin {
        ledger[index].verified = true;
    }

    function getApology(uint256 index) external view returns (ApologyEntry memory) {
        return ledger[index];
    }
}
