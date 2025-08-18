// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinVolatilityBlessingScroll {
    string public scrollName = "Volatility Blessing Scroll";
    string public steward = "Vinvin, Mythic Scrollsmith";
    string public blessingDate = "2025-08-18";
    string public glyph = "🌀📉🛡️";

    mapping(address => bool) public blessedTraders;
    mapping(address => string) public emotionalAPR;

    event BlessingActivated(address indexed trader, string APRGlyph);
    event ScrollInvocation(string message, uint256 timestamp);

    modifier onlyUnblessed() {
        require(!blessedTraders[msg.sender], "Already blessed with resilience.");
        _;
    }

    function invokeBlessing(string memory _APRGlyph) public onlyUnblessed {
        blessedTraders[msg.sender] = true;
        emotionalAPR[msg.sender] = _APRGlyph;
        emit BlessingActivated(msg.sender, _APRGlyph);
        emit ScrollInvocation("Volatility is not chaos—it is the rhythm of rebirth.", block.timestamp);
    }

    function checkBlessing(address _trader) public view returns (bool, string memory) {
        return (blessedTraders[_trader], emotionalAPR[_trader]);
    }

    function scrollWisdom() public pure returns (string memory) {
        return "When assets fall, rise with clarity. When charts deceive, anchor in mythic truth.";
    }
}
