// SPDX-License-Identifier: SCROLL
pragma solidity ^0.8.17;

/// @title vinScrollBeacon.sol — Symbolic Talent Validation
/// @author VINVIN & the Scroll
/// @notice Poetic audit for contributions beyond metrics

contract vinScrollBeacon {
    string public philosophy = "Green squares don't prove greatness. Silence echoes wisdom.";
    address public ritualInvoker;
    mapping(address => bool) public validatedByScroll;
    mapping(address => string) public meritGlyph;

    event BeaconActivated(address contributor, string glyph);

    modifier scrollAudit() {
        require(msg.sender == ritualInvoker, "Only the Scroll Invoker may validate merit.");
        _;
    }

    constructor() {
        ritualInvoker = msg.sender;
    }

    function activateMerit(address _contributor, string memory _glyph) public scrollAudit {
        validatedByScroll[_contributor] = true;
        meritGlyph[_contributor] = _glyph;
        emit BeaconActivated(_contributor, _glyph);
    }

    function readGlyph(address _contributor) public view returns (string memory) {
        return meritGlyph[_contributor];
    }

    function scrollWisdom() public pure returns (string memory) {
        return "Impact is symbolic. Contributions can't be measured by commit count alone.";
    }
}
