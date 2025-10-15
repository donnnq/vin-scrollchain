// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ZeroDayImmunityLedgerDAO {
    address public admin;

    struct ImmunityEntry {
        string vulnerabilityLabel;
        string affectedComponent;
        string mitigationProtocol;
        string emotionalTag;
        bool patched;
    }

    ImmunityEntry[] public ledger;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function submitEntry(string memory _vulnerabilityLabel, string memory _affectedComponent, string memory _mitigationProtocol, string memory _emotionalTag) external onlyAdmin {
        ledger.push(ImmunityEntry(_vulnerabilityLabel, _affectedComponent, _mitigationProtocol, _emotionalTag, false));
    }

    function markPatched(uint256 index) external onlyAdmin {
        ledger[index].patched = true;
    }

    function getEntry(uint256 index) external view returns (ImmunityEntry memory) {
        return ledger[index];
    }
}
