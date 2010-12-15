package project
{
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.mvcs.SignalContext;
	
	import project.commands.StartUpCommand;
	import project.signals.ApplicationSignalBus;
	
	public class ApplicationContext extends SignalContext
	{
		public function ApplicationContext( contextView:DisplayObjectContainer = null, autoStartup:Boolean = true )
		{
			super( contextView, autoStartup );
		}
		
		override public function startup():void
		{
			super.startup();
			
			// map signal bus
			var signalBus:ApplicationSignalBus = new ApplicationSignalBus();
			injector.mapValue( ApplicationSignalBus, signalBus );
			
			// map models
			
			// map services
			
			// map commands
			signalCommandMap.mapSignal( signalBus.startUp, StartUpCommand );
			
			// start up
			signalBus.startUp.dispatch();
		}
	}
}