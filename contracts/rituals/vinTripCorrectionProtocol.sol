// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract vinTripCorrectionProtocol {
    enum TripStatus { Initiated, LostSignal, KiligRestored, BadtripQuarantined }

    struct TripReport {
        address traveler;
        string journeyTag;
        string causeOfBadtrip; // e.g., Ego Burst, Misinformation Surge, Aura Contamination
        uint256 timestamp;
        TripStatus status;
        string remedyScroll; // Link or hash to healing lore
    }

    address public scrollkeeper;
    uint256 public tripCount;
    mapping(uint256 => TripReport) public tripLog;

    event TripSubmitted(uint256 indexed id, address indexed traveler, string journeyTag);
    event TripHealed(uint256 indexed id, TripStatus newStatus, string remedyScroll);

    constructor() {
        scrollkeeper = msg.sender;
    }

    function submitBadtrip(
        string memory _journeyTag,
        string memory _causeOfBadtrip
    ) public {
        tripLog[tripCount] = TripReport({
            traveler: msg.sender,
            journeyTag: _journeyTag,
            causeOfBadtrip: _causeOfBadtrip,
            timestamp: block.timestamp,
            status: TripStatus.LostSignal,
            remedyScroll: ""
        });

        emit TripSubmitted(tripCount, msg.sender, _journeyTag);
        tripCount++;
    }

    function restoreTrip(
        uint256 _id,
        string memory _remedyScroll
    ) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can heal.");
        require(_id < tripCount, "Trip does not exist.");

        TripReport storage report = tripLog[_id];
        report.status = TripStatus.KiligRestored;
        report.remedyScroll = _remedyScroll;

        emit TripHealed(_id, TripStatus.KiligRestored, _remedyScroll);
    }

    function quarantineTrip(uint256 _id) public {
        require(msg.sender == scrollkeeper, "Only scrollkeeper can quarantine.");
        require(_id < tripCount, "Trip does not exist.");

        tripLog[_id].status = TripStatus.BadtripQuarantined;
        emit TripHealed(_id, TripStatus.BadtripQuarantined, "");
    }

    function getTrip(uint256 _id) public view returns (TripReport memory) {
        return tripLog[_id];
    }
}
