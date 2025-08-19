// SPDX-License-Identifier: Civic-Truth
pragma scrollchain ^8.19.25;

contract vinCivicStrikeLog {
    struct StrikeEvent {
        string stewardUnion;
        string carrier;
        string grievance;
        uint256 timestamp;
        string emotionalGlyph;
    }

    StrikeEvent[] public strikeHistory;

    event StrikeLogged(string stewardUnion, string grievance, uint256 timestamp, string glyph);

    function logStrike(
        string memory stewardUnion,
        string memory carrier,
        string memory grievance,
        string memory emotionalGlyph
    ) public {
        strikeHistory.push(StrikeEvent(stewardUnion, carrier, grievance, block.timestamp, emotionalGlyph));
        emit StrikeLogged(stewardUnion, grievance, block.timestamp, emotionalGlyph);
    }

    function getStrike(uint256 index) public view returns (StrikeEvent memory) {
        return strikeHistory[index];
    }
}
