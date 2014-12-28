/*!
 * uniGUI Library extension for ExtJS
 * by Farshad Mohajeri  
 * Copyright(c) 2009-2012 FMSoft Inc.
 * info@fmsoft.net
 * http://www.unigui.com
 !*/

_log('here');
Ext.override(Ext.calendar.view.AbstractCalendar, {
	getEventRecord: function(id) {
	  var idx = this.store.findBy(function(rec, recId){return(rec.get(Ext.calendar.EventMappings.EventId.name)==id)});
	  return this.store.getAt(idx);
	}
});

Ext.override(Ext.calendar.CalendarPanel, {

	setItemDate: function(item) {
		var bb=null, dd=null;
	
		if (this.stDate)
			dd=this.stDate;
		else if (this.startDate)
			dd=this.startDate;
		
		if (dd) {
			var aa=dd.format('dmy');
	
			if (item.stDate)
				bb=item.stDate.format('dmy');
	
			if (aa!=bb) {
				item.stDate=dd;
				item.setStartDate(dd, true); 
			}
		}
	},

	onDayClick: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.onDayClick, function() {
		this.setItemDate(this.layout.activeItem);
	}),

	onWeekClick: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.onWeekClick, function() {
		this.setItemDate(this.layout.activeItem);
	}),

	onMonthClick: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.onMonthClick, function() {
		this.setItemDate(this.layout.activeItem);
	}),

  onPrevClick: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.onPrevClick, function() {
  	var a=this.layout.activeItem;
  	if (a) {
	  	if (a.startDate)
				this.stDate = a.startDate;
			else if (a.body)
				this.stDate = a.body.startDate;
		}
  }),

  onNextClick: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.onNextClick, function() {
  	var a=this.layout.activeItem;
  	if (a) {
	  	if (a.startDate)
				this.stDate = a.startDate;
			else if (a.body)
				this.stDate = a.body.startDate;
		}
  }),

	setStartDate: Ext.Function.createSequence(Ext.calendar.CalendarPanel.prototype.setStartDate, function(dt) {
		this.stDate = dt; 
		this.layout.activeItem.stDate = dt; 
	})
});
