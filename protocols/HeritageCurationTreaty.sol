// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HeritageCurationTreaty {
    address public steward;

    struct CurationClause {
        string siteName;
        string heritageElement;
        string curationAction;
        string emotionalTag;
    }

    CurationClause[] public treatyLog;

    event HeritageCurated(string siteName, string heritageElement, string curationAction, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized: Not the steward");
        _;
    }

    function curateHeritage(
        string memory siteName,
        string memory heritageElement,
        string memory curationAction,
        string memory emotionalTag
    ) public onlySteward {
        treatyLog.push(CurationClause(siteName, heritageElement, curationAction, emotionalTag));
        emit HeritageCurated(siteName, heritageElement, curationAction, emotionalTag);
    }
}
