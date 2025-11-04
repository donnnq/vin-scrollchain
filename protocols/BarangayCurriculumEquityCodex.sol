// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BarangayCurriculumEquityCodex {
    address public steward;

    struct EquityEntry {
        string barangay;
        string curriculumDomain;
        string equitySignal;
        string emotionalTag;
    }

    EquityEntry[] public codex;

    event CurriculumEquityTagged(string barangay, string curriculumDomain, string equitySignal, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagEquity(
        string memory barangay,
        string memory curriculumDomain,
        string memory equitySignal,
        string memory emotionalTag
    ) public onlySteward {
        codex.push(EquityEntry(barangay, curriculumDomain, equitySignal, emotionalTag));
        emit CurriculumEquityTagged(barangay, curriculumDomain, equitySignal, emotionalTag);
    }
}
