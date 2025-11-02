// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GlobalTreatyArchiveDAO {
    address public steward;

    struct TreatyEntry {
        string treatyName;
        string originYear;
        string reformStatus;
        string emotionalTag;
    }

    TreatyEntry[] public registry;

    event GlobalTreatyTagged(string treatyName, string originYear, string reformStatus, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function tagTreaty(
        string memory treatyName,
        string memory originYear,
        string memory reformStatus,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(TreatyEntry(treatyName, originYear, reformStatus, emotionalTag));
        emit GlobalTreatyTagged(treatyName, originYear, reformStatus, emotionalTag);
    }
}
