// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SenateSilenceToPublicHearingProtocol {
    address public steward;

    struct HearingEntry {
        string caseName;
        string involvedSenator;
        string silenceType; // "Non-response", "Delay", "Deflection"
        string hearingFormat; // "Livestream", "Citizen panel", "Senate floor"
        string emotionalTag;
        bool summoned;
        bool sealed;
    }

    HearingEntry[] public entries;

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Not authorized");
        _;
    }

    function summonHearing(string memory caseName, string memory involvedSenator, string memory silenceType, string memory hearingFormat, string memory emotionalTag) external onlySteward {
        entries.push(HearingEntry(caseName, involvedSenator, silenceType, hearingFormat, emotionalTag, true, false));
    }

    function sealHearingEntry(uint256 index) external onlySteward {
        require(entries[index].summoned, "Must be summoned first");
        entries[index].sealed = true;
    }

    function getHearingEntry(uint256 index) external view returns (HearingEntry memory) {
        return entries[index];
    }
}
