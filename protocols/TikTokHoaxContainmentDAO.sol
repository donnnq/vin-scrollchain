// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TikTokHoaxContainmentDAO {
    address public steward;

    struct ContainmentEntry {
        string contentReference;
        string hoaxSignal;
        string containmentMechanism;
        string emotionalTag;
    }

    ContainmentEntry[] public registry;

    event TikTokHoaxContained(string contentReference, string hoaxSignal, string containmentMechanism, string emotionalTag);

    constructor() {
        steward = msg.sender;
    }

    modifier onlySteward() {
        require(msg.sender == steward, "Unauthorized");
        _;
    }

    function containHoax(
        string memory contentReference,
        string memory hoaxSignal,
        string memory containmentMechanism,
        string memory emotionalTag
    ) public onlySteward {
        registry.push(ContainmentEntry(contentReference, hoaxSignal, containmentMechanism, emotionalTag));
        emit TikTokHoaxContained(contentReference, hoaxSignal, containmentMechanism, emotionalTag);
    }
}
