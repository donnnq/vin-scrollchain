// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract IntergenerationalLiteracyDAO {
    address public steward;

    struct LiteracyEntry {
        string community;
        string ageGroup;
        string literacyFocus;
        string emotionalTag;
    }

    LiteracyEntry[] public registry;

    event IntergenerationalLiteracyTagged(string community, string ageGroup, string literacyFocus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagLiteracy(
        string memory community,
        string memory ageGroup,
        string memory literacyFocus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(LiteracyEntry(community, ageGroup, literacyFocus, emotionalTag));
        emit IntergenerationalLiteracyTagged(community, ageGroup, literacyFocus, emotionalTag);
    }
}
