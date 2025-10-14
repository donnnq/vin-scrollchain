// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EthicsTribunalFestivalDAO {
    address public admin;

    struct TribunalEvent {
        string theme;
        string location;
        uint256 date;
        bool held;
    }

    TribunalEvent[] public events;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function scheduleEvent(string memory _theme, string memory _location, uint256 _date) external onlyAdmin {
        events.push(TribunalEvent(_theme, _location, _date, false));
    }

    function markHeld(uint256 index) external onlyAdmin {
        events[index].held = true;
    }

    function getEvent(uint256 index) external view returns (TribunalEvent memory) {
        return events[index];
    }
}
