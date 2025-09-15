// SPDX-License-Identifier: ExtortionSanctum
pragma solidity ^0.8.19;

contract ExtortionDeterrenceProtocol {
    struct ThreatEvent {
        string actorAlias;
        string method;
        bool dataLeakSiteAnnounced;
        bool extortionAttempted;
    }

    mapping(bytes32 => ThreatEvent) public events;

    event ThreatLogged(string actorAlias, string method);
    event ExtortionFlagged(string actorAlias);
    event LeakSiteAnnounced(string actorAlias);

    function logThreat(string memory actorAlias, string memory method) public {
        bytes32 eventId = keccak256(abi.encodePacked(actorAlias, method));
        events[eventId] = ThreatEvent(actorAlias, method, false, false);
        emit ThreatLogged(actorAlias, method);
    }

    function flagExtortion(string memory actorAlias, string memory method) public {
        bytes32 eventId = keccak256(abi.encodePacked(actorAlias, method));
        events[eventId].extortionAttempted = true;
        emit ExtortionFlagged(actorAlias);
    }

    function announceLeakSite(string memory actorAlias, string memory method) public {
        bytes32 eventId = keccak256(abi.encodePacked(actorAlias, method));
        events[eventId].dataLeakSiteAnnounced = true;
        emit LeakSiteAnnounced(actorAlias);
    }
}
