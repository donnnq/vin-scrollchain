// SPDX-License-Identifier: Mythic-Planetary
pragma solidity ^0.8.19;

contract BlessingDeckBorderAudit {
    struct BorderEvent {
        string nation;
        string steward;
        bool doorOpened;
        string reason;
        uint256 timestamp;
    }

    BorderEvent[] public events;

    event BorderLogged(string nation, string steward, bool doorOpened, string reason, uint256 timestamp);

    function logBorderEvent(string memory nation, string memory steward, bool doorOpened, string memory reason) public {
        events.push(BorderEvent(nation, steward, doorOpened, reason, block.timestamp));
        emit BorderLogged(nation, steward, doorOpened, reason, block.timestamp);
    }

    function getEvents() public view returns (BorderEvent[] memory) {
        return events;
    }
}
