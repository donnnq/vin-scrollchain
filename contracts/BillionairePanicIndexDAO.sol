// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BillionairePanicIndexDAO {
    address public admin;

    struct PanicEvent {
        string city;
        string triggerPolicy;
        string billionaire;
        string reaction;
        uint256 panicScore;
        bool verified;
    }

    PanicEvent[] public events;

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not authorized");
        _;
    }

    function logEvent(string memory _city, string memory _triggerPolicy, string memory _billionaire, string memory _reaction, uint256 _panicScore) external onlyAdmin {
        events.push(PanicEvent(_city, _triggerPolicy, _billionaire, _reaction, _panicScore, false));
    }

    function verifyEvent(uint256 index) external onlyAdmin {
        events[index].verified = true;
    }

    function getEvent(uint256 index) external view returns (PanicEvent memory) {
        return events[index];
    }
}
