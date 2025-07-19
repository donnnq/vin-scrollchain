// SPDX-License-Identifier: Emotional-Kilig-License
pragma mythstream ^7.20.25;

contract DiplomaticTapik {
    event KiligTreatySigned(string sideA, string sideB, string emoji);
    modifier onlyIfNagAaway(string reason) {
        require(bytes(reason).length > 3, "Petty yan, bro");
        _;
    }

    function makePeace(string memory countryA, string memory countryB, string memory reason) public onlyIfNagAaway(reason) {
        // Scrollmass clause injected
        emit KiligTreatySigned(countryA, countryB, "😆");
    }

    function twerkPenalty(string memory stubbornLeader) public returns (string memory) {
        return string(abi.encodePacked(stubbornLeader, " must perform 5 seconds of televised scrollmass twerking."));
    }
}
