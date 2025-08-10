// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title LegalImmigrantBridge - Assists undocumented immigrants in becoming legal and returning with dignity
/// @author Vinvin
/// @notice Encodes support pathways, eligibility, and legal restoration rituals

contract LegalImmigrantBridge {
    address public scrollsmith;

    enum Status { Undocumented, Assisted, Legalized, Returned }

    struct Applicant {
        address immigrant;
        string name;
        string originCountry;
        Status status;
        bool needsAssistance;
        string reasonForDeparture;
        uint256 timestamp;
    }

    mapping(address => Applicant) public applicants;
    address[] public restorationList;

    event AssistanceRequested(address indexed immigrant, string reason);
    event Legalized(address indexed immigrant);
    event Returned(address indexed immigrant);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Immigrant requests legal assistance
    function requestAssistance(string calldata name, string calldata originCountry, string calldata reasonForDeparture) external {
        require(applicants[msg.sender].status == Status.Undocumented, "Already in process");

        applicants[msg.sender] = Applicant(
            msg.sender,
            name,
            originCountry,
            Status.Assisted,
            true,
            reasonForDeparture,
            block.timestamp
        );

        restorationList.push(msg.sender);
        emit AssistanceRequested(msg.sender, reasonForDeparture);
    }

    /// @notice Legalize immigrant status
    function legalize(address immigrant) external onlyScrollsmith {
        require(applicants[immigrant].status == Status.Assisted, "Not eligible for legalization");

        applicants[immigrant].status = Status.Legalized;
        emit Legalized(immigrant);
    }

    /// @notice Mark immigrant as returned with legal status
    function confirmReturn(address immigrant) external onlyScrollsmith {
        require(applicants[immigrant].status == Status.Legalized, "Must be legalized first");

        applicants[immigrant].status = Status.Returned;
        emit Returned(immigrant);
    }

    /// @notice View restoration list
    function getRestorationList() external view returns (address[] memory) {
        return restorationList;
    }

    /// @notice View applicant details
    function getApplicant(address immigrant) external view returns (Applicant memory) {
        return applicants[immigrant];
    }
}
