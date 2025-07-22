// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// @title vinTakeItOrLeaveIt
/// @notice A one-time, irreversible “take it or leave it” offer. The receiver may accept or reject exactly once. After rejection, there’s no turning back.
contract vinTakeItOrLeaveIt {
    address public immutable offeror;       // Who created the offer
    address public immutable receiver;      // Who can accept or reject
    string  public immutable offerMessage;  // The pitch or invitation
    enum    Response { Pending, Accepted, Rejected }
    Response public response;               // Current status
    uint256 public responseTimestamp;       // When it was answered

    event OfferMade(address indexed offeror, address indexed receiver, string message);
    event OfferResponded(address indexed receiver, Response response, uint256 timestamp);

    modifier onlyReceiver() {
        require(msg.sender == receiver, "Not the designated receiver");
        _;
    }

    /// @param _receiver      Address of the invitee
    /// @param _offerMessage  What you’re asking them to join
    constructor(address _receiver, string memory _offerMessage) {
        offeror       = msg.sender;
        receiver      = _receiver;
        offerMessage  = _offerMessage;
        response      = Response.Pending;
        emit OfferMade(offeror, receiver, offerMessage);
    }

    /// @notice Receiver calls this to accept the offer. Irreversible.
    function acceptOffer() external onlyReceiver {
        require(response == Response.Pending, "Already decided");
        response = Response.Accepted;
        responseTimestamp = block.timestamp;
        emit OfferResponded(receiver, response, responseTimestamp);
    }

    /// @notice Receiver calls this to reject the offer. Irreversible.
    function rejectOffer() external onlyReceiver {
        require(response == Response.Pending, "Already decided");
        response = Response.Rejected;
        responseTimestamp = block.timestamp;
        emit OfferResponded(receiver, response, responseTimestamp);
    }
}
