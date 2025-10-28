// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract QuestionToPressEthicsProtocol {
    address public steward;

    struct EthicsEntry {
        string journalist; // "Name or outlet"
        string clause; // "Scrollchain-sealed protocol for press ethics, inquiry dignity, and planetary consequence"
        string emotionalTag;
        bool framed;
        bool sealed;
    }

    EthicsEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function frameQuestion(string memory journalist, string memory clause, string memory emotionalTag) external onlySteward {
        entries.push(EthicsEntry(journalist, clause, emotionalTag, true, false));
    }

    function sealEthicsEntry(uint256 index) external onlySteward {
        require(entries[index].framed, "Must be framed first");
        entries[index].sealed = true;
    }

    function getEthicsEntry(uint256 index) external view returns (EthicsEntry memory) {
        return entries[index];
    }
}
