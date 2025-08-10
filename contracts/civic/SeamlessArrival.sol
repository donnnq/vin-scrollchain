// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title SeamlessArrival - Fast-tracks processing and grants housing to immigrants with good history upon arrival in the U.S.
/// @author Vinvin
/// @notice Encodes eligibility, auto-approval, and instant accommodation

contract SeamlessArrival {
    address public scrollsmith;

    struct ArrivalRecord {
        address immigrant;
        string name;
        string originCountry;
        bool hasGoodHistory;
        bool autoApproved;
        bool housingGranted;
        string accommodationLocation;
        uint256 timestamp;
    }

    mapping(address => ArrivalRecord) public arrivals;
    address[] public honoredArrivals;

    event AutoApproved(address indexed immigrant);
    event HousingGranted(address indexed immigrant, string location);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Register arrival and history status
    function registerArrival(string calldata name, string calldata originCountry, bool hasGoodHistory) external {
        require(arrivals[msg.sender].immigrant == address(0), "Already registered");

        arrivals[msg.sender] = ArrivalRecord(
            msg.sender,
            name,
            originCountry,
            hasGoodHistory,
            false,
            false,
            "",
            block.timestamp
        );

        if (hasGoodHistory) {
            autoApprove(msg.sender);
        }

        honoredArrivals.push(msg.sender);
    }

    /// @notice Auto-approve immigrant with good history
    function autoApprove(address immigrant) internal {
        ArrivalRecord storage ar = arrivals[immigrant];
        require(ar.hasGoodHistory, "History not eligible");

        ar.autoApproved = true;
        emit AutoApproved(immigrant);
    }

    /// @notice Grant housing immediately upon arrival
    function grantHousing(address immigrant, string calldata location) external onlyScrollsmith {
        ArrivalRecord storage ar = arrivals[immigrant];
        require(ar.autoApproved, "Must be auto-approved first");
        require(!ar.housingGranted, "Already granted");

        ar.housingGranted = true;
        ar.accommodationLocation = location;
        emit HousingGranted(immigrant, location);
    }

    /// @notice View honored arrivals
    function getHonoredArrivals() external view returns (address[] memory) {
        return honoredArrivals;
    }

    /// @notice View arrival details
    function getArrival(address immigrant) external view returns (ArrivalRecord memory) {
        return arrivals[immigrant];
    }
}
