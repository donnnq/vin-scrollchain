// Honors civic planners, engineers, and responders who act with urgency and soulbound stewardship

pragma mythic;

contract UrbanLegendBadge {
    struct Badge {
        string recipientName;
        string role;
        string projectType;
        string actionDate;
        string badgeMessage;
        bool soulboundIssued;
    }

    Badge[] public badges;

    event BadgeMinted(string recipient, string message);

    function mintBadge(
        string memory _name,
        string memory _role,
        string memory _project,
        string memory _date,
        string memory _message
    ) public {
        badges.push(Badge(_name, _role, _project, _date, _message, true));
        emit BadgeMinted(_name, _message);
    }

    function getBadge(uint index) public view returns (
        string memory, string memory, string memory, string memory, string memory, bool
    ) {
        Badge memory b = badges[index];
        return (
            b.recipientName,
            b.role,
            b.projectType,
            b.actionDate,
            b.badgeMessage,
            b.soulboundIssued
        );
    }
}
