// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract vinSanctuaryRequestDeck {
    struct SanctuaryRequest {
        string nation;
        string steward;
        string reason;
        uint256 timestamp;
        bool blessed;
    }

    SanctuaryRequest[] public requests;

    event SanctuaryLogged(string nation, string steward, string reason, uint256 timestamp);
    event SanctuaryBlessed(string nation, string steward);

    function logRequest(string memory nation, string memory steward, string memory reason) public {
        requests.push(SanctuaryRequest(nation, steward, reason, block.timestamp, false));
        emit SanctuaryLogged(nation, steward, reason, block.timestamp);
    }

    function blessSanctuary(uint index) public {
        require(index < requests.length, "Invalid index");
        requests[index].blessed = true;
        emit SanctuaryBlessed(requests[index].nation, requests[index].steward);
    }

    function getRequests() public view returns (SanctuaryRequest[] memory) {
        return requests;
    }
}
