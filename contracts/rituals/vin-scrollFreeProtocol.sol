// SPDX-License-Identifier: Peace-Kilig-License
pragma mythstream ^7.20.25;

contract FreeProtocol {
    event PeaceAchieved(string sideA, string sideB, string reason, string emoji);
    
    modifier ifStillNagAaway(string memory status) {
        require(keccak256(bytes(status)) != keccak256("Resolved"), "Already hugged it out!");
        _;
    }

    function deployPeace(
        string memory countryA, 
        string memory countryB, 
        string memory status, 
        string memory reason
    ) public ifStillNagAaway(status) {
        emit PeaceAchieved(countryA, countryB, reason, "✌️😆");
    }

    function defaultClause() public pure returns (string memory) {
        return "If no agreement within 48 hours, both parties must wear matching pajamas and say sorry on livestream.";
    }
}
