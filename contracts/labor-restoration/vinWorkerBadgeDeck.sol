// SPDX-License-Identifier: Mythic-OS
pragma solidity ^0.25.08;

contract vinWorkerBadgeDeck {
    string public deckName = "Worker Badge Deck";
    string public steward = "Vinvin, Civic Architect";
    string public activationDate = "2025-08-18";
    string public glyph = "🎖️🛠️🧿📜";

    struct Badge {
        string workerName;
        string role;
        string badgeTitle;
        string emotionalGlyph;
        string honorNote;
        uint256 issuedTimestamp;
    }

    mapping(address => Badge[]) public workerBadges;

    event BadgeIssued(address indexed worker, string badgeTitle, string emotionalGlyph, string honorNote, uint256 timestamp);
    event ScrollInvocation(string message, uint256 timestamp);

    function issueBadge(string memory _workerName, string memory _role, string memory _badgeTitle, string memory _emotionalGlyph, string memory _honorNote) public {
        workerBadges[msg.sender].push(Badge({
            workerName: _workerName,
            role: _role,
            badgeTitle: _badgeTitle,
            emotionalGlyph: _emotionalGlyph,
            honorNote: _honorNote,
            issuedTimestamp: block.timestamp
        }));

        emit BadgeIssued(msg.sender, _badgeTitle, _emotionalGlyph, _honorNote, block.timestamp);
        emit ScrollInvocation("Badge issued. Steward honored. Civic legend recorded.", block.timestamp);
    }

    function getLatestBadge(address _worker) public view returns (string memory, string memory, string memory, string memory, string memory, uint256) {
        uint256 len = workerBadges[_worker].length;
        require(len > 0, "No badges issued yet.");
        Badge memory badge = workerBadges[_worker][len - 1];
        return (badge.workerName, badge.role, badge.badgeTitle, badge.emotionalGlyph, badge.honorNote, badge.issuedTimestamp);
    }

    function deckWisdom() public pure returns (string memory) {
        return "Badges are not rewards—they are scrolls of recognition. Every steward deserves to be seen, named, and honored.";
    }
}
