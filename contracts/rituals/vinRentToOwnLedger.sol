// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinRentToOwnLedger {
    struct HousingOffer {
        string unitId;
        uint256 totalCost;
        uint256 monthlyDeduction;
        uint256 monthsRemaining;
        bool accepted;
        bool completed;
    }

    mapping(address => HousingOffer) public housingLedger;

    event OfferMade(address indexed worker, string unitId, uint256 totalCost, uint256 monthlyDeduction);
    event OfferAccepted(address indexed worker);
    event PaymentLogged(address indexed worker, uint256 monthsRemaining);

    function offerHousing(
        address worker,
        string memory unitId,
        uint256 totalCost,
        uint256 monthlyDeduction
    ) public {
        require(housingLedger[worker].totalCost == 0, "Offer already exists.");
        uint256 months = totalCost / monthlyDeduction;
        housingLedger[worker] = HousingOffer(unitId, totalCost, monthlyDeduction, months, false, false);
        emit OfferMade(worker, unitId, totalCost, monthlyDeduction);
    }

    function acceptOffer(address worker) public {
        require(!housingLedger[worker].accepted, "Already accepted.");
        housingLedger[worker].accepted = true;
        emit OfferAccepted(worker);
    }

    function logMonthlyPayment(address worker) public {
        require(housingLedger[worker].accepted, "Offer not accepted.");
        require(housingLedger[worker].monthsRemaining > 0, "Already completed.");
        housingLedger[worker].monthsRemaining--;
        if (housingLedger[worker].monthsRemaining == 0) {
            housingLedger[worker].completed = true;
        }
        emit PaymentLogged(worker, housingLedger[worker].monthsRemaining);
    }

    function getHousingStatus(address worker) public view returns (
        string memory, uint256, uint256, uint256, bool, bool
    ) {
        HousingOffer memory h = housingLedger[worker];
        return (
            h.unitId,
            h.totalCost,
            h.monthlyDeduction,
            h.monthsRemaining,
            h.accepted,
            h.completed
        );
    }
}
